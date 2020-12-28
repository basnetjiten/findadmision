import 'package:findadmissionaffiliate/models/student/std_load_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DegreeReceiveDropDown extends StatefulWidget {
  final List<Award> award;
  final ValueChanged<Award> onAwardChange;

  DegreeReceiveDropDown({
    this.award,
    this.onAwardChange,
  });

  @override
  _DegreeReceiveDropDownState createState() => _DegreeReceiveDropDownState();
}

class _DegreeReceiveDropDownState extends State<DegreeReceiveDropDown> {
  bool _autoValidate = false;
  Award initialEngPro;

  @override
  void initState() {
    initialEngPro = widget.award[0];
    super.initState();
  }

  // String initialEngProText;

  @override
  Widget build(BuildContext context) {
    //prAward("country list"+widget.countryList.length.toString());
    return Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.white),
        child: DropdownButtonFormField<Award>(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          itemHeight: 55,
          elevation: 1,
          hint: Text(
            initialEngPro.highawardName,
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
          style: TextStyle(color: Colors.black, fontSize: 15),
          isDense: false,
          isExpanded: true,
          iconSize: 24.0,
          iconEnabledColor: Colors.black,
          items: widget.award.map((Award award) {
            return DropdownMenuItem<Award>(
              value: award,
              child: Container(
                child: Text(
                  award.highawardName,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
            );
          }).toList(),
          onChanged: (Award value) {
            setState(() {
              initialEngPro = value;

              widget.onAwardChange(initialEngPro);
            });
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          value: initialEngPro,
          validator: (value) => value == null ? '' : null,
          decoration: InputDecoration(
            fillColor: Colors.transparent,
            errorMaxLines: 1,
            errorStyle: TextStyle(height: 0),
            hintText: initialEngPro.highawardName,
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
