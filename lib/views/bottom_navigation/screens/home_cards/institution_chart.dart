import 'dart:math';

import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class InstitutionChart extends StatefulWidget {
  //final Widget child;

  //InstitutionChart({Key key, this.child}) : super(key: key);

  _InstitutionChartState createState() => _InstitutionChartState();
}

class _InstitutionChartState extends State<InstitutionChart> {
  List<charts.Series<Institution, String>> _seriesPieData;
  List<Institution> piedata=[];

//dummy data generation
  _generateData() {
    dashboardDataRes.instcountryper.forEach((inst) {
      final institute =  Institution(inst.countryName, inst.percentage, Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0));
          piedata.add(institute);
    });
    _seriesPieData.add(
      charts.Series(
        domainFn: (Institution institute, _) => institute.instName,
        measureFn: (Institution institute, _) => institute.instPercent,
        colorFn: (Institution institute, _) =>
            charts.ColorUtil.fromDartColor(institute.colorval),
        id: 'Institute',
        data: piedata,
        labelAccessorFn: (Institution row, _) => '${row.instPercent}',
      ),
    );

  }

  @override
  void initState() {
    super.initState();
    _seriesPieData = List<charts.Series<Institution, String>>();
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "Countries where our institutions",
                style: AppTheme.profileInfoStyle.copyWith(
                    fontSize: 18.0,
                    color:AppTheme.cardTitleTxtColor,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                  height: 200,
                  child: charts.PieChart(_seriesPieData,
                      animate: false,
                      animationDuration: Duration(seconds: 5),
                      defaultRenderer: new charts.ArcRendererConfig(
                        strokeWidthPx: 0.03,
                          arcWidth: 80,
                          arcRendererDecorators: [
                            new charts.ArcLabelDecorator(
                                labelPosition: charts.ArcLabelPosition.inside)
                          ]))),
              MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: piedata.length,
                    itemBuilder: (context, index) {
                      Institution institute = piedata[index];
                      return (Container(
                        height: 30,
                        width: 100,
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal:sizeConfig.isMediumScreen() ? sizeConfig.screenWidth*0.085:sizeConfig.screenWidth*0.12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 12,
                                        width: 12,
                                        color: institute.colorval,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(institute.instName),
                                    ],
                                  )
                                ],
                              ),

                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                      institute.instPercent.toString() + "%")
                                ],
                              )
                            ],
                          ),
                        ),
                      ));
                    }),
              ),
              SizedBox(
                height: 25,
              )
            ],
          ),
        ),
      ),
    );
  }
}



class Institution {

  String instName;
  double instPercent;
  Color colorval;

  Institution(this.instName, this.instPercent, this.colorval);
}


