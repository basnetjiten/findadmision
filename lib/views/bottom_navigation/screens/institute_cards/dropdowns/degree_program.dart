import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/models/app_check.dart';
import 'package:findadmissionaffiliate/models/institute/institute_detail_page.dart';
import 'package:findadmissionaffiliate/models/institute/loaddata_label.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/institute_cards/application_step_one.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class DegreeProgramDropDown extends StatefulWidget {
  final Instapolicy initialInstapolicy;
  final List<Instapolicy> instaPolicyList;
  final ValueChanged<Instapolicy> onDegreeProgramSelected;

  DegreeProgramDropDown({
    this.initialInstapolicy,
    this.instaPolicyList,
    this.onDegreeProgramSelected,
  });

  @override
  _DegreeProgramDropDownState createState() => _DegreeProgramDropDownState();
}

class _DegreeProgramDropDownState extends State<DegreeProgramDropDown> {
  bool _autoValidate = false;
  Instapolicy instaPolicy;
  List<InstDetailStartDate> startDateList = <InstDetailStartDate>[];
  InstDetailStartDate startDate;

  @override
  void initState() {
    instaPolicy = widget.initialInstapolicy;
    startDate = widget.initialInstapolicy.startdates[0];
    startDateList.addAll(widget.initialInstapolicy.startdates);
    print(instaPolicy.degreeName);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //print("country list"+widget.countryList.length.toString());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Theme(
            data: Theme.of(context).copyWith(canvasColor: Colors.white),
            child: DropdownButtonFormField<Instapolicy>(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              itemHeight: 55,
              elevation: 1,
              hint: Text(
                instaPolicy.degreeName,
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              style: TextStyle(color: Colors.black, fontSize: 15),
              isDense: false,
              isExpanded: true,
              iconSize: 24.0,
              iconEnabledColor: Colors.black,
              items: widget.instaPolicyList.map((Instapolicy instapol) {
                return DropdownMenuItem<Instapolicy>(
                  value: instapol,
                  child: Container(
                    child: Text(
                      instapol.degreeName,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                );
              }).toList(),
              onChanged: _onInstaChanged,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              value: instaPolicy,
              validator: (value) => value == null ? '' : null,
              decoration: InputDecoration(
                fillColor: Colors.transparent,
                errorMaxLines: 1,
                errorStyle: TextStyle(height: 0),
                hintText: instaPolicy.degreeName,
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
                contentPadding: const EdgeInsets.only(left: 7, top: -5),
                hintMaxLines: 4,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(7.0),
                  ),
                  borderSide: BorderSide(width: 1, color: Colors.grey),
                ),
              ),
            )),
        SizedBox(
          height: 15,
        ),
        Text(
          "Start Date",
          style:
              AppTheme.studentLabelStyle.copyWith(fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: 10,
        ),
        Theme(
            data: Theme.of(context).copyWith(canvasColor: Colors.white),
            child: DropdownButtonFormField<InstDetailStartDate>(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              itemHeight: 55,
              elevation: 1,
              hint: Text(
                startDate.text,
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              style: TextStyle(color: Colors.black, fontSize: 15),
              isDense: false,
              isExpanded: true,
              iconSize: 24.0,
              iconEnabledColor: Colors.black,
              items: startDateList.map((InstDetailStartDate instStartDate) {
                return DropdownMenuItem<InstDetailStartDate>(
                  value: instStartDate,
                  child: Container(
                    child: Text(
                      instStartDate.text,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                );
              }).toList(),
              onChanged: (InstDetailStartDate value) {
                setState(() {
                  startDate = value;
                  stepOneDto.startDate= value;
                  //widget.onDegreeProgramSelected(instaPolicy);
                });
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              value: startDate ?? null,
              validator: (value) => value == null ? '' : null,
              decoration: InputDecoration(
                fillColor: Colors.transparent,
                errorMaxLines: 1,
                errorStyle: TextStyle(height: 0),
                // hintText: startDate.value,
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
                contentPadding: const EdgeInsets.only(left: 7, top: -5),
                hintMaxLines: 4,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(7.0),
                  ),
                  borderSide: BorderSide(width: 1, color: Colors.grey),
                ),
              ),
            )),
      ],
    );
  }

/*void getUserDefaultCourse(String userCourseCode) {
    widget.countryList.forEach((country) {
      if (country.countryShortcode == userCourseCode) {
        setState(() {
          countryName = country.countryName;
        });
        // widget.onCourseChange(country.degreeProgramCourse);
      }
    });
  }*/

  void _onInstaChanged(Instapolicy value) {
    setState(() {
      instaPolicy = value;
      startDate = value.startdates[0];
      startDateList.clear();
      startDateList.addAll(value.startdates);
      stepOneDto.instapolicy= value;
      //print(stepOneDto.instapolicy.degreeId);
    });
  }
}
