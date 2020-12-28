import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/utils/tip_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  final Function onPressed;
  final bool bottomIcons;
  final String text;
  final IconData icons;

  BottomBar(
      {@required this.onPressed,
      @required this.bottomIcons,
      @required this.icons,
      @required this.text});

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onPressed,
        child: widget.bottomIcons == true
            ? Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Column(
                  children: [
                    Container(
                      height: 38,
                      decoration: ShapeDecoration(
                          color: AppTheme.checkBoxCheckedColor,
                        shape: TooltipShapeBorder(arrowArc: 0.1),
                         ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left:4,top:7.0,right: 4),
                          child: Text(
                            widget.text,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 12),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.fromLTRB(4,5,5,8),
                child: Container(
                  height: 05,
                  width: 30,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: AppTheme.checkBoxCheckedColor)),
                  child: Center(
                    child: Text(widget.text[0],
                        style: TextStyle(
                            color: AppTheme.checkBoxCheckedColor,
                            fontWeight: FontWeight.normal,
                            fontSize: 12)),
                  ),
                ),
              ));
  }
}
