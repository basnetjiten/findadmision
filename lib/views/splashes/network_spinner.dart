import 'dart:async';
import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:findadmissionaffiliate/bloc/authentication_bloc/authentication_event.dart';
import 'package:findadmissionaffiliate/bloc/authentication_bloc/authentication_state.dart';
import 'package:findadmissionaffiliate/constants/routing_constants.dart';
import 'package:findadmissionaffiliate/helpers/login_type_enum.dart';
import 'package:findadmissionaffiliate/views/splashes/new_app_update.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NetworkWorkerSpinner extends StatefulWidget {
  @override
  Splash createState() => Splash();
}

class Splash extends State<NetworkWorkerSpinner> {
  AuthenticationBloc _authenticationBloc;

  @override
  void initState() {
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    _authenticationBloc.add(AppStarted(initialStart: LoginType.INITIAL));
    super.initState();
  }
  @override
  void dispose() {
    _authenticationBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      cubit: _authenticationBloc,
      listener: (context, state) {
        if (state is DisplayUpdateAppMessage) {

          showLoginDialog(context, state.appCheck,state.localLoginResponse);
        } else if (state is NoUpdateAppDialog) {
          Navigator.pushReplacementNamed(context, DashBoardRoute,
              arguments: state.localLoginResponse);
        }

        else if (state is LogOutUser) {
          Navigator.pushReplacementNamed(context, LoginViewRoute);
        }

      },
      child: Scaffold(
          backgroundColor: AppTheme.lightGreyBGColour,
          body: Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
            child: Container(
              child: Center(
                child: Column(
                  children: [
                    Container(
                      height: 76,
                      width: 295,
                      child: Text(
                        "Start turning your network, contacts and connections into money by joining Findadmission.com affiliate program!",
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ), //<- place where the image appears
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Theme(
                        data: ThemeData(
                            cupertinoOverrideTheme: CupertinoThemeData(
                                brightness: Brightness.dark)),
                        child: CupertinoActivityIndicator(
                          radius: 25,
                        ))
                  ],
                ),
              ),
            ),
          )),
    );
  }

 /* dynamic onClose(AppCheck appCheckData) {
    Navigator.of(context).pushReplacement(PageRouteBuilder(
        maintainState: false,
        opaque: true,
        pageBuilder: (context, _, __) => LoginPage(),
        transitionDuration: const Duration(milliseconds: 1000),
        transitionsBuilder: (context, anim1, anim2, child) {
          return new FadeTransition(
            child: child,
            opacity: anim1,
          );
        }));
  }*/

  Future showLoginDialog(context, appCheck,loginResponse) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return NewAppUpdate(
            appCheck: appCheck,
              loginResponse:loginResponse
          );
        });
  }
}
