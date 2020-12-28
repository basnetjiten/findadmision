import 'dart:math';

import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:findadmissionaffiliate/bloc/students/student_bloc/add_students_bloc.dart';
import 'package:findadmissionaffiliate/helpers/appwidget_helper.dart';
import 'package:findadmissionaffiliate/models/app_check.dart';
import 'package:findadmissionaffiliate/models/student/student_list_res.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/add_student_card.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/dropdowns/student_status_dropdown.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/student_list_card.dart';
import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StudentIndexPage extends StatefulWidget {
  @override
  _StudentIndexPageState createState() => _StudentIndexPageState();
}

class _StudentIndexPageState extends State<StudentIndexPage> {
  AddStudentsBloc addStudentsBloc;
  StudentListResponse studentListResponse;
  List<Widget> studentCardList;
  List<Widget> paginatedCardList;
  int selectedIndex = 0;
  int startItem = 0;
  int endItem = 10;
  int rowsShown = 10;
  TextStyle subTitle =
      AppTheme.studentLabelStyle.copyWith(color: AppTheme.cardTitleTxtColor);
  final _random = new Random();
  Studentstatus initialStatus;

  @override
  void initState() {
    initialStatus = appCheck.studentstatus[0];
    studentCardList = [];
    paginatedCardList = [];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    addStudentsBloc = BlocProvider.of<AddStudentsBloc>(context);

    print("STD PAGE REBUILDING");
    return Scaffold(
      backgroundColor: AppTheme.greyBackground,
      body: Container(
        height: sizeConfig.screenHeight,
        width: sizeConfig.screenWidth,
        child: Padding(
          padding:
              EdgeInsets.fromLTRB(15, sizeConfig.screenHeight * 0.15, 15, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset("assets/student.svg"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Students",
                                    style: AppTheme.helperLabelStyle.copyWith(
                                        fontSize: 18.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              MaterialButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                color: AppTheme.checkBoxCheckedColor,
                                minWidth: 75,
                                height: 100,
                                textColor: Colors.white,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "Add",
                                      style: TextStyle(
                                          fontSize: 16.0, color: Colors.white),
                                    ),
                                  ],
                                ),
                                onPressed: () async {
                                  final Studentlist list =
                                      await Navigator.of(context).push(
                                          CupertinoPageRoute(
                                              builder: (_) =>
                                                  BlocProvider<AddStudentsBloc>(
                                                      create: (context) =>
                                                          addStudentsBloc,
                                                      child:
                                                          AddStudentCard())));
                                  if (list != null) {
                                    addStudentsBloc
                                        .add(FetchStudentList(status: 0));
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 44,
                          // width: 290,
                          decoration: BoxDecoration(

                              // color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              border: Border.all(
                                  color: AppTheme.checkBoxCheckedColor)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: Center(
                                child: StudentStatusDropDown(
                              initialStatus: initialStatus,
                              studentStatusList: appCheck.studentstatus,
                              onStatusChange: onStdStatusChange,
                            )),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: sizeConfig.screenWidth * 0.5,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: TextFormField(
                                    cursorColor: AppTheme.cardTitleTxtColor,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(10),
                                        hintText: 'key words..',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.0)),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(7.0)),
                                          borderSide: BorderSide(
                                              width: 1, color: Colors.grey),
                                        ))),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              color: AppTheme.officeBGColor,
                              minWidth: 110,
                              height: 50,
                              textColor: Colors.white,
                              child: Text(
                                "Search",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                BlocBuilder<AddStudentsBloc, AddStudentsState>(
                  cubit: addStudentsBloc,
                  // ignore: missing_return
                  builder: (context, state) {
                    if (state is AddStudentsInitial) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is StudentListFetching) {
                      return Center(
                          child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: AppWidgetHelper.loadingIndicator(),
                      ));
                    }

                    if (state is StudentApiEmpty) {
                      return Center(
                          child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text("No Student found!"),
                      ));
                    }
                    if (state is StudentListFetched) {
                      studentListResponse = state.studentListRes;
                      studentCardList = List.generate(
                          studentListResponse.studentlist.length,
                          (int index) => StudentList(
                              initialStatus: initialStatus,
                              studentlist:
                                  studentListResponse.studentlist[index]));
                      return paginatedCardList.isEmpty
                          ? Column(
                              key: ValueKey<int>(
                                  _random.nextInt(studentCardList.length)),
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                RichText(
                                    text: new TextSpan(children: [
                                  TextSpan(
                                      text: 'Showing ',
                                      style: AppTheme.instituteStyle.copyWith(
                                          color: AppTheme.cardTitleTxtColor,
                                          fontWeight: FontWeight.w400)),
                                  TextSpan(
                                      text: '$startItem ',
                                      style: AppTheme.instituteStyle.copyWith(
                                          color: AppTheme.checkBoxCheckedColor,
                                          fontWeight: FontWeight.w400)),
                                  TextSpan(
                                      text: '-',
                                      style: AppTheme.instituteStyle.copyWith(
                                          color: AppTheme.cardTitleTxtColor,
                                          fontWeight: FontWeight.w400)),
                                  TextSpan(
                                      text: '$endItem ',
                                      style: AppTheme.instituteStyle.copyWith(
                                          color: AppTheme.checkBoxCheckedColor,
                                          fontWeight: FontWeight.w400)),
                                  TextSpan(
                                      text: 'of ',
                                      style: AppTheme.instituteStyle.copyWith(
                                          color: AppTheme.cardTitleTxtColor,
                                          fontWeight: FontWeight.w400)),
                                  TextSpan(
                                      text: '${studentCardList.length} ',
                                      style: AppTheme.chipStyle.copyWith(
                                          color: AppTheme.checkBoxCheckedColor,
                                          fontWeight: FontWeight.w400)),
                                  TextSpan(
                                      text: 'students',
                                      style: AppTheme.instituteStyle.copyWith(
                                          color: AppTheme.cardTitleTxtColor,
                                          fontWeight: FontWeight.w400)),
                                ])),
                                SizedBox(
                                  height: 10,
                                ),
                                ...studentCardList.map((element) {
                                  var index = studentCardList.indexOf(element);
                                  if (index <= 9) {
                                    return element;
                                  } else {
                                    return SizedBox();
                                  }
                                }).toList(),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Showing $startItem  of $endItem  Results",
                                  style: AppTheme.helperLabelStyle.copyWith(
                                      fontSize: 14.0,
                                      color: AppTheme.cardTitleTxtColor),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  key: ValueKey<int>(
                                      _random.nextInt(studentCardList.length)),
                                  height: 50,
                                  width: 500,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount:
                                          (studentCardList.length / rowsShown)
                                              .round(),
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 9.0, vertical: 4),
                                          child: Container(
                                              height: 30,
                                              width: 56,
                                              decoration: BoxDecoration(
                                                  color: selectedIndex == index
                                                      ? AppTheme
                                                          .instituteTextColor
                                                      : Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  border: Border.all(
                                                      color: AppTheme
                                                          .instituteTextColor)),
                                              child: ListTile(
                                                  title: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 8.0),
                                                    child: Center(
                                                        child: Text(
                                                      '${index + 1}',
                                                      style: TextStyle(
                                                          color: selectedIndex ==
                                                                  index
                                                              ? Colors.white
                                                              : AppTheme
                                                                  .instituteTextColor,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16.0),
                                                    )),
                                                  ),
                                                  onTap: () {
                                                    setState(() {
                                                      selectedIndex = index;
                                                      onStudentPageSelected(
                                                          selectedIndex);
                                                    });
                                                  })),
                                        );
                                      }),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            )
                          : Column(
                              key: ValueKey<dynamic>(paginatedCardList),
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                RichText(
                                    text: new TextSpan(children: [
                                  TextSpan(
                                      text: 'Showing ',
                                      style: AppTheme.instituteStyle.copyWith(
                                          color: AppTheme.cardTitleTxtColor,
                                          fontWeight: FontWeight.w400)),
                                  TextSpan(
                                      text: '$startItem ',
                                      style: AppTheme.instituteStyle.copyWith(
                                          color: AppTheme.checkBoxCheckedColor,
                                          fontWeight: FontWeight.w400)),
                                  TextSpan(
                                      text: '-',
                                      style: AppTheme.instituteStyle.copyWith(
                                          color: AppTheme.cardTitleTxtColor,
                                          fontWeight: FontWeight.w400)),
                                  TextSpan(
                                      text: ' $endItem ',
                                      style: AppTheme.instituteStyle.copyWith(
                                          color: AppTheme.checkBoxCheckedColor,
                                          fontWeight: FontWeight.w400)),
                                  TextSpan(
                                      text: 'of ',
                                      style: AppTheme.instituteStyle.copyWith(
                                          color: AppTheme.cardTitleTxtColor,
                                          fontWeight: FontWeight.w400)),
                                  TextSpan(
                                      text:
                                          '${studentListResponse.studentlist.length} ',
                                      style: AppTheme.chipStyle.copyWith(
                                          color: AppTheme.checkBoxCheckedColor,
                                          fontWeight: FontWeight.w400)),
                                  TextSpan(
                                      text: 'students',
                                      style: AppTheme.instituteStyle.copyWith(
                                          color: AppTheme.cardTitleTxtColor,
                                          fontWeight: FontWeight.w400)),
                                ])),
                                SizedBox(
                                  height: 10,
                                ),
                                ...paginatedCardList.map((element) {
                                  var index =
                                      paginatedCardList.indexOf(element);
                                  if (index <= 9) {
                                    return element;
                                  } else {
                                    return SizedBox();
                                  }
                                }).toList(),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Showing $endItem of ${studentListResponse.studentlist.length}",
                                  style: AppTheme.helperLabelStyle.copyWith(
                                      fontSize: 14.0,
                                      color: AppTheme.cardTitleTxtColor),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  key: ValueKey<int>(
                                      _random.nextInt(studentCardList.length)),
                                  height: 50,
                                  width: 500,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount:
                                          (studentCardList.length / rowsShown)
                                              .round(),
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 9.0, vertical: 4),
                                          child: Container(
                                              height: 30,
                                              width: 56,
                                              decoration: BoxDecoration(
                                                  color: selectedIndex == index
                                                      ? AppTheme
                                                          .instituteTextColor
                                                      : Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  border: Border.all(
                                                      color: AppTheme
                                                          .instituteTextColor)),
                                              child: ListTile(
                                                  title: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 8.0),
                                                    child: Center(
                                                        child: Text(
                                                      '${index + 1}',
                                                      style: TextStyle(
                                                          color: selectedIndex ==
                                                                  index
                                                              ? Colors.white
                                                              : AppTheme
                                                                  .instituteTextColor,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16.0),
                                                    )),
                                                  ),
                                                  onTap: () {
                                                    setState(() {
                                                      selectedIndex = index;
                                                      onStudentPageSelected(
                                                          selectedIndex);
                                                    });
                                                  })),
                                        );
                                      }),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            );
                    }
                    /*if (state is StudentAddSuccess) {
                     return  renderStudentList();
                    }*/
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildStudentPagination() {
    return Container(
      key: ValueKey<int>(_random.nextInt(studentCardList.length)),
      height: 50,
      width: 500,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: (studentCardList.length / rowsShown).round(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9.0, vertical: 4),
              child: Container(
                  height: 30,
                  width: 56,
                  decoration: BoxDecoration(
                      color: selectedIndex == index
                          ? AppTheme.instituteTextColor
                          : Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: AppTheme.instituteTextColor)),
                  child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Center(
                            child: Text(
                          '${index + 1}',
                          style: TextStyle(
                              color: selectedIndex == index
                                  ? Colors.white
                                  : AppTheme.instituteTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        )),
                      ),
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                          onStudentPageSelected(selectedIndex);
                        });
                      })),
            );
          }),
    );
  }

  void onStudentPageSelected(int currentPage) {
    final List<Widget> temp = [];
    startItem = currentPage * rowsShown;
    endItem = (startItem + rowsShown) > studentCardList.length
        ? studentCardList.length
        : (startItem + rowsShown);
    var realTotal = studentListResponse.studentlist.length;
    print("START" + startItem.toString() + "END" + endItem.toString());
    print("PAGINATED STD CARD" + studentCardList.length.toString());
    for (var i = startItem; i < realTotal; i++) {
      setState(() {
        temp.add(studentCardList[i]);
        print("TEMP SIZE" + temp.length.toString());
      });
    }
    if (temp.isNotEmpty) {
      setState(() {
        print("here");
        paginatedCardList = temp;
      });
    } else {
      setState(() {
        studentCardList.clear();
      });
    }
    //studentCardList.shuffle(_random);
  }

  void onStdStatusChange(Studentstatus stdStatus) {
    setState(() {
      initialStatus = stdStatus;
      studentCardList.clear();
      paginatedCardList.clear();
      addStudentsBloc.add(FetchStudentList(status: stdStatus.id));
    });
  }
}
