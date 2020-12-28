import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/dto/students/std_apply_course_dto.dart';
import 'package:findadmissionaffiliate/helpers/appwidget_helper.dart';
import 'package:findadmissionaffiliate/models/institute/institute_detail_page.dart';
import 'package:findadmissionaffiliate/models/student/std_load_data.dart';
import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:findadmissionaffiliate/dto/institutes/courses.dart';

class StdMax3CourseDialog extends StatefulWidget {
  StdMax3CourseDialog({
    this.dep,
    this.title,
    this.options,
    this.selectedOptions,
    this.onSelectedOptionListChanged,
  });

  final String title;
  final Dep dep;
  final List<Course> options;
  final List<Selectedcoursearr> selectedOptions;
  final ValueChanged<List<Selectedcoursearr>> onSelectedOptionListChanged;

  @override
  StdMax3CourseDialogState createState() => StdMax3CourseDialogState();
}

class StdMax3CourseDialogState extends State<StdMax3CourseDialog> {
  List<Selectedcoursearr> _tempSelectedOption = List();
  List<String> requiredKey = List();
  bool chipSelected = false;
  List<Selectedcoursearr> courseOptions = [];

  _buildChoiceList(List<Selectedcoursearr> displayCourse) {
    List<Widget> choices = [];
    displayCourse.forEach((courseChip) {
      //print("COURSES"+courseChip.name+courseChip.dep+courseChip.id);
      //print(_tempSelectedOption.contains(courseChip).toString());
      chipSelected = _tempSelectedOption.contains(courseChip);
      //print("CHIP SELECTED" + chipSelected.toString());
      // print(courseOption.course.length.toString());
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          avatar: chipSelected
              ? Icon(
            Icons.check,
            color: Colors.white,
            size: 16,
          )
              : null,
          selectedColor: AppTheme.chipSelectedColor,
          backgroundColor: Colors.white,
          shape: chipSelected
              ? RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          )
              : RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
              side: BorderSide(
                width: 0.5,
                color: AppTheme.instituteTextColor,
              )),
          label: Text(
            courseChip.name,
            style: chipSelected
                ? TextStyle(color: Colors.white)
                : TextStyle(color: AppTheme.instituteTextColor),
          ),
          selected: chipSelected,
          onSelected: (bool selected) {
            /* setState(() {
              _tempSelectedOption.contains(item)
                  ? _tempSelectedOption.remove(item)
                  : _tempSelectedOption.add(item);
              widget.onSelectionChanged(_tempSelectedOption); // +added
            });*/

            if (selected && _tempSelectedOption.length < 3) {
              if (!_tempSelectedOption.contains(courseChip)) {
                setState(() {
                  _tempSelectedOption.add(courseChip);
                  chipSelected = selected;
                });
              }
            } else {
              if (_tempSelectedOption.contains(courseChip)) {
                setState(() {
                  _tempSelectedOption.removeWhere((Selectedcoursearr option) =>
                  option.name == courseChip.name);
                });
              }
            }
            widget.onSelectedOptionListChanged(_tempSelectedOption);
          },
        ),
      ));
    });
    return choices;
  }

  @override
  void initState() {
    widget.options.forEach((course) {
      Selectedcoursearr applyCourse = Selectedcoursearr(
          dep: widget.dep.id,
          name: course.name,
          showing: course.selected,
          id: course.id);
      courseOptions.add(applyCourse);
    });
    if (widget.selectedOptions != null && widget.selectedOptions.isNotEmpty) {
      widget.selectedOptions.forEach((selectedOption) {
        //print("SELECTED OPTIONS"+selectedOption.name);
        // print("SELECTED OPTIONS"+selectedOption.name+selectedOption.dep+selectedOption.id);
        _tempSelectedOption.add(selectedOption);
      });
    } else {
      _tempSelectedOption = widget.selectedOptions;
    }

    super.initState();
  }

  @override
  void dispose() {
    // proposalSearchBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: AlertDialog(
          title: Column(
            children: [
              Text(
                this.widget.title,
                style: AppTheme.dialogDetailInfoStyle
                    .copyWith(fontSize: 18.0, fontWeight: FontWeight.w700),
              ),
              AppWidgetHelper.divider()
            ],
          ),
          content: Container(
            height: sizeConfig.screenHeight / 2,
            width: sizeConfig.screenWidth,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Wrap(
                          children: _buildChoiceList(courseOptions),
                        ),
                      ],
                    ),
                  ),
                ),
                AppWidgetHelper.divider(),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                          side: BorderSide(
                              color: AppTheme.instituteTextColor,
                              width: 1.0,
                              style: BorderStyle.solid)),
                      minWidth: sizeConfig.screenWidth / 2.6,
                      height: 47,
                      textColor: Colors.white,
                      child: Text(
                        "Back",
                        style: TextStyle(
                            fontSize: 16.0,
                            color: AppTheme.instituteTextColor,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.8),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(_tempSelectedOption);
                      },
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      minWidth: sizeConfig.screenWidth / 2.7,
                      height: 48,
                      color: AppTheme.instituteTextColor,
                      child: Text(
                        "Add",
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.8),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(_tempSelectedOption);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }

/*  Flexible buildFlexible() {
    return Flexible(
      child: Container(
        width: sizeConfig.screenWidth * 0.9,
        // height: SizeConfig.screenHeight * 0.7,
        child: buildDialogOptionList(),
      ),
    );
  }

  Container buildDialogContainer(Selectedcoursearr selected) {

    return Container(
      child: Theme(
        data: ThemeData(unselectedWidgetColor: Color(0xffACACAC)),
        child: CheckboxListTile(
            activeColor: Colors.blue,
            controlAffinity: ListTileControlAffinity.leading,
            value: _tempSelectedOption.contains(selected),
            title: Text(
              selected.name,
            ),
            onChanged: (bool value) {
              //print(_tempSelectedOption.length.toString());
              //checking if the maximum number of selected Industry is more than 3
              if (value && _tempSelectedOption.length < 3) {
                if (!_tempSelectedOption.contains(selected)) {
                  setState(() {
                    _tempSelectedOption.add(selected);
                  });
                }
              } else {
                if (_tempSelectedOption.contains(selected)) {
                  setState(() {
                    _tempSelectedOption.removeWhere(
                        (Selectedcoursearr option) => option.id == selected.id);
                  });
                }
              }
              //widget.onSelectedOptionListChanged(_tempSelectedOption);
            }),
      ),
    );
  }

  buildDialogOptionList() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: courseOptions.length,
        itemBuilder: (BuildContext context, int index) {
          final optionForSelection = courseOptions[index];
          return Column(
            children: <Widget>[
              buildDialogContainer(optionForSelection),
            ],
          );
        });
  }*/
}
