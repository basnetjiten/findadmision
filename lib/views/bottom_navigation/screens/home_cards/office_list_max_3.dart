import 'package:findadmissionaffiliate/bloc/office_list_bloc/office_list_bloc.dart';
import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:findadmissionaffiliate/main.dart';
import '../../bottom_nav.dart';
import 'package:findadmissionaffiliate/models/home/office_list.dart';

List<OfficeList> officeList;

class MaxThreeOfficeList extends StatefulWidget {
  @override
  _MaxThreeOfficeListState createState() => _MaxThreeOfficeListState();
}

class _MaxThreeOfficeListState extends State<MaxThreeOfficeList> {
  OfficeListBloc _officeListBloc;
  final textStyle = GoogleFonts.workSans(
      textStyle: AppTheme.helperLabelStyle
          .copyWith(color: Colors.white, fontWeight: FontWeight.w600));

  @override
  void initState() {
    officeList = [];
    _officeListBloc = OfficeListBloc();
    _officeListBloc.add(FetchOfficeList(accessToken: accessToken));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: AppTheme.instituteTextColor),
      height: 277,
      width: sizeConfig.screenWidth,
      child: Container(
        padding: const EdgeInsets.all(20),
        // height: 200,
        width: 500,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "My Office",
              style: textStyle.copyWith(
                  fontSize: 18.0, fontWeight: FontWeight.w800),
            ),
            SizedBox(
              height: 20,
            ),
            MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: BlocBuilder(
                cubit: _officeListBloc,
                // ignore: missing_return
                builder: (context, state) {
                  if(state is OfficeRemoved){
                   // AppWidgetHelper.showSnackBar("Office Deleted", context,AppTheme.checkBoxCheckedColor);
                  }
                  if (state is OfficeListInitial) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state is OfficeListFetched) {
                    officeList = state.officeListResponse.officeList;
                    return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:
                            officeList.length >= 3 ? 3 : officeList.length,
                        itemBuilder: (context, index) {
                          final office = officeList[index];
                          return Container(
                            height: 50,
                            width: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 20,
                                  width: 100,
                                  child: Text(
                                    office.countryName,
                                    style: textStyle,
                                  ),
                                ),
                                Divider(
                                  color: Colors.white,
                                  thickness: 0.5,
                                )
                              ],
                            ),
                          );
                        });
                  } else if (state is OfficeListEmpty) {}
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                onTap: () {
                  final CupertinoTabBar navigationBar = globalKey.currentWidget;
                  navigationBar.onTap(4);
                },
                child: Container(
                  height: 20,
                  width: 102,
                  child: Row(
                    children: [
                      Text(
                        "See More",
                        style: AppTheme.helperLabelStyle
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.navigate_next,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
