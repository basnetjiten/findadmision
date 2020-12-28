import 'dart:async';
import 'dart:convert';
import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:findadmissionaffiliate/dto/firebase_notification.dart';
import 'package:findadmissionaffiliate/helpers/get_it.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/institute_cards/institute_details.dart';
import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:findadmissionaffiliate/helpers/router.dart' as router;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notification_permissions/notification_permissions.dart';
import 'package:overlay_support/overlay_support.dart';

String accessToken;
FirebaseMessaging fcm;
String fcmToken = "";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  fcm = FirebaseMessaging();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //systemNavigationBarColor: Colors.blue, // navigation bar color
    statusBarColor: AppTheme.darkGreyBGColour, // status bar color
  ));
  PermissionStatus requestPermission =
      await NotificationPermissions.requestNotificationPermissions();

  if (requestPermission == PermissionStatus.granted) {
    PermissionStatus permissionStatus =
        await NotificationPermissions.getNotificationPermissionStatus();
    if (permissionStatus == PermissionStatus.granted) {
      fcm.requestNotificationPermissions();

      fcmToken = await fcm.getToken();
      fcm.onTokenRefresh.listen((newToken) {
        fcmToken = newToken;
      });
      print("FCM TOKEN" + fcmToken);
    } else {
      await NotificationPermissions.requestNotificationPermissions();
    }
  }

  //setup the async get_it
  setupLocator();
  runApp(OverlaySupport(child: MyApp()));
}

Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
  if (message.containsKey('data')) {
    // Handle data message
    final dynamic data = message['data'];
  }

  if (message.containsKey('notification')) {
    // Handle notification message
    final dynamic notification = message['notification'];
  }

  // Or do other work.
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthenticationBloc _authenticationBloc;

  @override
  void initState() {
    _authenticationBloc = getIt<AuthenticationBloc>();
    // fcm.subscribeToTopic(fcmToken);
    fcm.configure(
      onMessage: (Map<String, dynamic> message) async {

        showOverlayNotification((context) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: SafeArea(
              child: ListTile(
                onTap: () {
                  OverlaySupportEntry.of(context).dismiss();
                  notificationNavigation(message);
                },
                leading: SizedBox.fromSize(
                    size: const Size(40, 40),
                    child: ClipOval(
                        child: CircleAvatar(
                      radius: 20,
                      backgroundImage:
                          AssetImage("assets/images/notification.png"),
                    ))),
                title: Text(message['notification']['title']),
                subtitle: Text(message['notification']['body']),
                trailing: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      OverlaySupportEntry.of(context).dismiss();
                    }),
              ),
            ),
          );
        }, duration: Duration(milliseconds: 9000));
      },
      onBackgroundMessage: myBackgroundMessageHandler,
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        notificationNavigation(message);
      },
      onResume: (Map<String, dynamic> message) async {
        notificationNavigation(message);
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _authenticationBloc,
      child: MaterialApp(
        onGenerateRoute: router.generateRoute,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'SfPro',
          cursorColor: Colors.white,
          unselectedWidgetColor: Color(0xff212F3F),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
          ),
          // primaryColor: Colors.transparent,
          //primarySwatch: Colors.blue,
          // visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(),
      ),
    );
  }

  void notificationNavigation(Map<String, dynamic> message) {
    final Map<String, dynamic> data = Map.from(message['data']);
    final Map<String, String> pageParams = Map<String, String>.from(data);

    final notificationMap = json.decode(pageParams["pageparams"]);
    final FirebaseNotification firebaseNotification =
        FirebaseNotification.fromJson(notificationMap);
    if (firebaseNotification.pushtype == "institute") {
      Navigator.of(context).push(MaterialPageRoute<BuildContext>(
          builder: (_) => InstituteDetails(
                universityId: firebaseNotification.instituteid,
              )));
    }
  }
}
