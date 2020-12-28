import 'package:findadmissionaffiliate/models/student/std_load_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TranscriptDropDown extends StatefulWidget {
  final List<Transcript> tranacript;
  final ValueChanged<Transcript> onTranscriptChange;

  TranscriptDropDown({
    this.tranacript,
    this.onTranscriptChange,
  });

  @override
  _TranscriptDropDownState createState() => _TranscriptDropDownState();
}

class _TranscriptDropDownState extends State<TranscriptDropDown> {
  bool _autoValidate = false;
  Transcript initialTranscript;

  @override
  void initState() {
    initialTranscript = widget.tranacript[0];
    super.initState();
  }

  // String initialTranscriptText;

  @override
  Widget build(BuildContext context) {
    //prTranscript("country list"+widget.countryList.length.toString());
    return Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.white),
        child: DropdownButtonFormField<Transcript>(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          itemHeight: 55,
          elevation: 1,
          hint: Text(
            initialTranscript.transcriptName,
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
          style: TextStyle(color: Colors.black, fontSize: 15),
          isDense: false,
          isExpanded: true,
          iconSize: 24.0,
          iconEnabledColor: Colors.black,
          items: widget.tranacript.map((Transcript tranacript) {
            return DropdownMenuItem<Transcript>(
              value: tranacript,
              child: Container(
                child: Text(
                  tranacript.transcriptName,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
            );
          }).toList(),
          onChanged: (Transcript value) {
            setState(() {
              initialTranscript = value;

              widget.onTranscriptChange(initialTranscript);
            });
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          value: initialTranscript,
          validator: (value) => value == null ? '' : null,
          decoration: InputDecoration(
            fillColor: Colors.transparent,
            errorMaxLines: 1,
            errorStyle: TextStyle(height: 0),
            hintText: initialTranscript.transcriptName,
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
