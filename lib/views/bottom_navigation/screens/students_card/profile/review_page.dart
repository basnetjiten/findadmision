
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/profile/review.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/profile/review_success.dart';
import 'package:flutter/material.dart';

class PreviewPage extends StatefulWidget {
  final ValueChanged<int> backToStepper;
  PreviewPage({this.backToStepper});
  @override
  _PreviewPageState createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {

  int initialSelection =0;

  void onSubmit(int value) {
    setState(() {
      initialSelection=value;
    });

  }

  List<Widget> previewPages;

  @override
  void initState() {
    previewPages=[ProfileLastStepPreview(onSubmitted: onSubmit,backToCheck:widget.backToStepper),ReviewSuccess()];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return previewPages[initialSelection];
  }


}
