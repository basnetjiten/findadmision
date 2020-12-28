import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/models/app_check.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudentStatusDropDown extends StatefulWidget {
  final Studentstatus initialStatus;
  final List<Studentstatus> studentStatusList;
  final ValueChanged<Studentstatus> onStatusChange;

  StudentStatusDropDown({
    this.initialStatus,
    this.studentStatusList,
    this.onStatusChange,
  });

  @override
  _StudentStatusDropDownState createState() => _StudentStatusDropDownState();
}

class _StudentStatusDropDownState extends State<StudentStatusDropDown> {
  bool _autoValidate = false;
  Studentstatus initialStatus;

  @override
  void initState() {
    initialStatus = widget.initialStatus;
    super.initState();
  }

  // String initialStatusText;

  @override
  Widget build(BuildContext context) {
    //prStudentstatus("country list"+widget.countryList.length.toString());
    return Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.white),

        child: DropdownButtonFormField<Studentstatus>(

          onTap: () {
            FocusScope.of(context).unfocus();
          },
          itemHeight: 55,
          elevation: 1,
          hint: Text(
            initialStatus.name,
            style: TextStyle(color: AppTheme.checkBoxCheckedColor, fontSize: 15),
          ),
          style: TextStyle(color: AppTheme.checkBoxCheckedColor, fontSize: 15),
          isDense: true,
          isExpanded: true,
          iconSize: 24.0,
          iconEnabledColor: Colors.black,
          items: widget.studentStatusList.map((Studentstatus studentStatusList) {
            return DropdownMenuItem<Studentstatus>(
              value: studentStatusList,
              child: Container(
                child: Text(
                  studentStatusList.name,
                  style:  AppTheme.dropDownTextStyle.copyWith(fontSize:16.0,color: AppTheme.checkBoxCheckedColor),
                ),
              ),
            );
          }).toList(),
          onChanged: (Studentstatus value) {
            setState(() {
              initialStatus = value;

              widget.onStatusChange(initialStatus);
            });
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          value: initialStatus,
          validator: (value) => value == null ? '' : null,
          decoration: InputDecoration(
            fillColor: Colors.transparent,
            errorMaxLines: 1,
            errorStyle: TextStyle(height: 0),
            hintText: initialStatus.name,
            hintStyle: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
            contentPadding: const EdgeInsets.only(left: 7, top: -5),
            hintMaxLines: 4,
            enabledBorder: OutlineInputBorder(

              borderSide: BorderSide(width: 0, color: Colors.transparent),
            ),
          ),
        ));
  }
}
