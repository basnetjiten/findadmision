import 'package:carousel_slider/carousel_slider.dart';
import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:findadmissionaffiliate/bloc/institutes/save_inst_bloc/save_inst_bloc.dart';
import 'package:findadmissionaffiliate/helpers/appwidget_helper.dart';
import 'package:findadmissionaffiliate/models/dashboard_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewInstituteCarouselCard extends StatefulWidget {
  final List<String> imageList;

  NewInstituteCarouselCard({this.imageList});

  @override
  _NewInstituteCarouselCardState createState() =>
      _NewInstituteCarouselCardState();
}

class _NewInstituteCarouselCardState extends State<NewInstituteCarouselCard> {
  int _current = 0;
  Widget carouselImage;
  List<Recentinst> recentinst = [];
  List<Widget> _imageWidgetList = [];
  SaveInstBloc _saveInstBloc;
  bool isSaved;

  @override
  void initState() {
    _saveInstBloc = SaveInstBloc();
    recentinst = dashboardDataRes.recentinst;

    recentinst.forEach((recentInst) {
      _imageWidgetList.add(
        Container(
          height: 100,
          // width: 350,
          color: AppTheme.addedInstituteBG,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Newly Added Institutions",
                  style: AppTheme.profileInfoStyle.copyWith(
                      color: AppTheme.cardTitleTxtColor,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        recentInst.institutesName,
                        style: AppTheme.instituteStyle,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    IconButton(
                      icon: recentInst.saved
                          ? Icon(
                              Icons.favorite,
                              size: 27,
                              color: AppTheme.favouriteBtnColor,
                            )
                          : Icon(
                              Icons.favorite_border,
                              size: 27,
                              color: AppTheme.favouriteBtnColor,
                            ),
                      onPressed: () {
                        if (recentInst.saved) {
                          setState(() {
                            recentInst.saved = false;
                            _saveInstBloc.add(
                                DeleteInst(instId: recentInst.institutesId));
                          });
                        } else {
                          setState(() {
                            recentInst.saved = true;
                            _saveInstBloc
                                .add(SaveInst(instId: recentInst.institutesId));
                          });
                        }
                      },
                    )
                  ],
                ),
                //SizedBox(height: 5,),
                Text(
                  recentInst.countryName,
                  style: AppTheme.chipStyle
                      .copyWith(color: AppTheme.locationTxtColor),
                ),
              ],
            ),
          ),
        ),
      );
    });
    // widget.imageList.forEach((image) {
    //carouselImage = Container(height: 100,width: 200,color: AppTheme.addedInstituteBG,);
    //_imageWidgetList.add(carouselImage);
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SaveInstBloc, SaveInstState>(
      cubit: _saveInstBloc,
      listener: (context, state) {
        if (state is InstSaved) {
          AppWidgetHelper.showSnackBar(
              "Institute saved", context, AppTheme.checkBoxCheckedColor);
        }
        if (state is InstDeleted) {
          AppWidgetHelper.showSnackBar(
              "Institute deleted", context, AppTheme.officeBGColor);
        }
      },
      child: Container(
        child: Stack(
          children: <Widget>[
            CarouselSlider(
              items: _imageWidgetList,
              autoPlay: false,
              // height: 250,
              aspectRatio: 16 / 9,
              viewportFraction: 0.99,
              onPageChanged: (index) {
                setState(() {
                  _current = index;
                });
              },
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 5,
              left: MediaQuery.of(context).size.width / 2.6,
              right: 10.0,
              bottom: 10.0,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: dashboardDataRes.recentinst.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Container(
                        width: 8.0,
                        height: 8.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _current == index
                                ? Color.fromRGBO(0, 0, 0, 0.9)
                                : Color.fromRGBO(0, 0, 0, 0.4)),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
