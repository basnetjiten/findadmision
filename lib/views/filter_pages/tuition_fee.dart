import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TuitionFeeFilter extends StatefulWidget {
  final ValueChanged<RangeValues> feeRange;
  TuitionFeeFilter({this.feeRange});
  @override
  _TuitionFeeFilterState createState() => _TuitionFeeFilterState();
}

class _TuitionFeeFilterState extends State<TuitionFeeFilter> {
  RangeValues values = RangeValues(1, 60);
  RangeLabels labels = RangeLabels('1', '60');

  @override
  void initState() {
    //SitePreferences.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle tileStyle =
        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Padding(
            padding:  EdgeInsets.fromLTRB(sizeConfig.isMediumScreen() ?sizeConfig.screenWidth*0.23:sizeConfig.screenWidth*0.16, sizeConfig.screenHeight*0.11, 0, 0),
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Drawer(
                  child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () {
                              widget.feeRange(values);
                              Navigator.of(context).pop();

                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              size: 20,
                            )),
                        Text("Tuition Fee", style: tileStyle),
                        SizedBox(
                          width: 25,
                        ),
                      /*  MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                              side: BorderSide(
                                  color: AppTheme.checkBoxCheckedColor,
                                  width: 1.0,
                                  style: BorderStyle.solid)),
                          minWidth: 80,
                          height: 40,
                          textColor: Colors.white,
                          child: Text(
                            "Clear All",
                            style: TextStyle(
                                fontSize: 14.0,
                                color: AppTheme.checkBoxCheckedColor,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.8),
                          ),
                          onPressed: () {},
                        ),*/
                      ],
                    ),
                    Divider(
                      color: AppTheme.cardTitleTxtColor,
                      thickness: 0.7,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text("Tuition Fee Range",
                          style: tileStyle.copyWith(
                              fontSize: 14.0, fontWeight: FontWeight.normal)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        " ${'£' + values.start.toInt().toString()}\k - "
                        "${'£' + values.end.toInt().toString()}k",
                        style: TextStyle(
                            color: AppTheme.locationTxtColor, fontSize: 14.0),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SliderTheme(
                      data: SliderThemeData(
                          activeTickMarkColor: Colors.transparent,
                          inactiveTickMarkColor: Colors.transparent,
                          thumbColor: Color(0xff169311),
                          trackHeight: 10,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 20.0),
                          // overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                          activeTrackColor: Color(0xff74D870)),
                      child: RangeSlider(
                        min: 1,
                        max: 60,
                        values: values,
                        divisions: 60,
                        labels: labels,
                        onChanged: (value) {
                          print('START: ${value.start}, END: ${value.end}');
                          setState(() {
                            values = value;
                            labels = RangeLabels(
                                '${value.start.toInt().toString()}k',
                                '${value.end.toInt().toString()}k');

                          });

                        },
                      ),
                    ),
                  ],
                ),
              )),
            ),
          ),
          Positioned(
            top: sizeConfig.screenHeight*0.12,
            left: sizeConfig.isMediumScreen() ?sizeConfig.screenWidth*0.07: sizeConfig.screenWidth*0.02,
           right: 10,
            bottom: 0,
            child: Align(
              alignment: Alignment.topLeft,
              child: Material(
                type: MaterialType.transparency,
                child: IconButton(
                    onPressed: () {
                      widget.feeRange(values);
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.close,
                      size: 27.0,
                      color: Colors.white,
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
