import 'package:findadmissionaffiliate/models/institute/institute_detail_page.dart';
import 'package:findadmissionaffiliate/models/student/std_load_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PteDropDown extends StatefulWidget {
  final List<Engpro> engPro;
  final ValueChanged<Engpro> onPteChanged;

  PteDropDown({
    this.engPro,
    this.onPteChanged,
  });

  @override
  _PteDropDownState createState() => _PteDropDownState();
}

class _PteDropDownState extends State<PteDropDown> {
  bool _autoValidate = false;
  Engpro initialEngPro;

  @override
  void initState() {
    initialEngPro = widget.engPro[0];
    super.initState();
  }
  // String initialEngProText;

  @override
  Widget build(BuildContext context) {
    //prEngpro("country list"+widget.countryList.length.toString());
    return Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.white),
        child: DropdownButtonFormField<Engpro>(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          itemHeight: 55,
          elevation: 1,
          hint: Text(
            initialEngPro.engproName,
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
          style: TextStyle(color: Colors.black, fontSize: 15),
          isDense: false,
          isExpanded: true,
          iconSize: 24.0,
          iconEnabledColor: Colors.black,
          items: widget.engPro.map((Engpro engpro) {
            return DropdownMenuItem<Engpro>(
              value: engpro,
              child: Container(
                child: Text(
                  engpro.engproName,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
            );
          }).toList(),
          onChanged: (Engpro value) {
            setState(() {
              initialEngPro = value;

              widget.onPteChanged(initialEngPro);
            });
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          value:  initialEngPro,

          validator: (value) => value == null ? '' : null,
          decoration: InputDecoration(
            fillColor: Colors.transparent,
            errorMaxLines: 1,
            errorStyle: TextStyle(height: 0),
            hintText:
            initialEngPro.engproName,
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
