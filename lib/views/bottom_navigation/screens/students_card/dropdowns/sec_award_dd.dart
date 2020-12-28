import 'package:findadmissionaffiliate/models/institute/institute_detail_page.dart';
import 'package:findadmissionaffiliate/models/student/std_load_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecAwardBodyDD extends StatefulWidget {
  final List<Secaward> secAward;
  final ValueChanged<Secaward> onSecAwardChanged;

  SecAwardBodyDD({
    this.secAward,
    this.onSecAwardChanged,
  });

  @override
  _SecAwardBodyDDState createState() => _SecAwardBodyDDState();
}

class _SecAwardBodyDDState extends State<SecAwardBodyDD> {
  bool _autoValidate = false;
  Secaward initialSecAward;

  @override
  void initState() {
    initialSecAward = widget.secAward[0];
    super.initState();
  }
  // String initialSecAwardText;

  @override
  Widget build(BuildContext context) {
    //prSecaward("country list"+widget.countryList.length.toString());
    return Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.white),
        child: DropdownButtonFormField<Secaward>(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          itemHeight: 55,
          elevation: 1,
          hint: Text(
            initialSecAward.secawardName,
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
          style: TextStyle(color: Colors.black, fontSize: 15),
          isDense: false,
          isExpanded: true,
          iconSize: 24.0,
          iconEnabledColor: Colors.black,
          items: widget.secAward.map((Secaward start) {
            return DropdownMenuItem<Secaward>(
              value: start,
              child: Container(
                child: Text(
                  start.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
            );
          }).toList(),
          onChanged: (Secaward value) {
            setState(() {
              initialSecAward = value;

              widget.onSecAwardChanged(initialSecAward);
            });
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          value:  initialSecAward!=null ? initialSecAward :widget.secAward[0],

          validator: (value) => value == null ? '' : null,
          decoration: InputDecoration(
            fillColor: Colors.transparent,
            errorMaxLines: 1,
            errorStyle: TextStyle(height: 0),
            hintText:
            initialSecAward.secawardName,
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
        ));
  }
}
