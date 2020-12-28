import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget implements PreferredSizeWidget {

  final TabBar tabBar;

  CustomTabBar({
    Key key,
    this.tabBar,
  }) : super(key: key);

  @override
  Size get preferredSize => tabBar.preferredSize;

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  
  
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
   // print("DEVICEWIDTH"+deviceWidth.toString());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
         // color: Colors.greenAccent,
          width: deviceWidth,
          height: 50,
          child:  Center(child: widget.tabBar,),
        ),
      ],
    );
  }
}
