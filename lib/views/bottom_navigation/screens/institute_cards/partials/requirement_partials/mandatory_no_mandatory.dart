import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/models/institute/institute_detail_page.dart';
import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flutter/material.dart';

class MandatoryNoMandatoryPage extends StatefulWidget {
  final InstituteDetailRes institute;

  MandatoryNoMandatoryPage({this.institute});

  @override
  _MandatoryNoMandatoryPageState createState() =>
      _MandatoryNoMandatoryPageState();
}

class _MandatoryNoMandatoryPageState extends State<MandatoryNoMandatoryPage> {
  final subTitleGaping = const SizedBox(height: 5.0);
  List<Folder> folderList = [];
  final titleGaping = const SizedBox(height: 15.0);

  final TextStyle titleStyle = AppTheme.studentLabelStyle
      .copyWith(fontSize: 18, fontWeight: FontWeight.w700);

  final TextStyle subTitleStyle =
      AppTheme.studentLabelStyle.copyWith(fontWeight: FontWeight.w600);

  final TextStyle smallTitleStyle =
      AppTheme.studentLabelStyle.copyWith(fontWeight: FontWeight.w400);

  @override
  void initState() {
    widget.institute.folders.values.forEach((element) {
      folderList.addAll(element);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              "Mandatory",
              style: titleStyle,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: sizeConfig.screenWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppTheme.containerBG,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: folderList.length,
                    // ignore: missing_return
                    itemBuilder: (context, index) {
                      final instFolder = folderList[index];

                      if (instFolder.institutereqlistMandatory == "1") {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              instFolder.subfilesName,
                              style: subTitleStyle,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              instFolder.subfilesDescription,
                              style: smallTitleStyle,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Not Mandatory",
              style: titleStyle,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: sizeConfig.screenWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppTheme.containerBG,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: folderList.length,
                    // ignore: missing_return
                    itemBuilder: (context, index) {
                      final instFolder = folderList[index];

                      if (instFolder.institutereqlistMandatory == "2") {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              instFolder.subfilesName,
                              style: subTitleStyle,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              instFolder.subfilesDescription,
                              style: smallTitleStyle,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        );
                      } else {
                        return SizedBox();
                      }
                    },
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
