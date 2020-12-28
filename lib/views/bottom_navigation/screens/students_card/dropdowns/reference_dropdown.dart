import 'package:findadmissionaffiliate/models/student/std_load_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReferenceDropDown extends StatefulWidget {
  final List<Reference> reference;
  final ValueChanged<Reference> onReferenceChange;

  ReferenceDropDown({
    this.reference,
    this.onReferenceChange,
  });

  @override
  _ReferenceDropDownState createState() => _ReferenceDropDownState();
}

class _ReferenceDropDownState extends State<ReferenceDropDown> {
  bool _autoValidate = false;
  Reference initialReference;

  @override
  void initState() {
    initialReference = widget.reference[0];
    super.initState();
  }

  // String initialReferenceText;

  @override
  Widget build(BuildContext context) {
    //prReference("country list"+widget.countryList.length.toString());
    return Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.white),
        child: DropdownButtonFormField<Reference>(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          itemHeight: 55,
          elevation: 1,
          hint: Text(
            initialReference.referenceName,
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
          style: TextStyle(color: Colors.black, fontSize: 15),
          isDense: false,
          isExpanded: true,
          iconSize: 24.0,
          iconEnabledColor: Colors.black,
          items: widget.reference.map((Reference reference) {
            return DropdownMenuItem<Reference>(
              value: reference,
              child: Container(
                child: Text(
                  reference.referenceName,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
            );
          }).toList(),
          onChanged: (Reference value) {
            setState(() {
              initialReference = value;

              widget.onReferenceChange(initialReference);
            });
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          value: initialReference,
          validator: (value) => value == null ? '' : null,
          decoration: InputDecoration(
            fillColor: Colors.transparent,
            errorMaxLines: 1,
            errorStyle: TextStyle(height: 0),
            hintText: initialReference.referenceName,
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
