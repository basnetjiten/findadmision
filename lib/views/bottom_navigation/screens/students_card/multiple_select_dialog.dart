import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/models/univ.dart';
import 'package:findadmissionaffiliate/univ_global.dart';
import 'package:findadmissionaffiliate/utils/dialog_type.dart';
import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailInfoDialog extends StatefulWidget {
  DetailInfoDialog({
    this.fromProfileEdit,
    this.dialogType,
    this.title,
    this.options,
    this.selectedOptions,
   // this.onSelectedOptionListChanged,
  });

  final bool fromProfileEdit;
  final DialogType dialogType;

  /*final UserProfileData userProfileData;
  final MenuListData menuListData;*/
  final String title;
  final List<dynamic> options;
  final List<dynamic> selectedOptions;
  //final ValueChanged<List<dynamic>> onSelectedOptionListChanged;

  @override
  DetailInfoDialogState createState() => DetailInfoDialogState();
}

class DetailInfoDialogState extends State<DetailInfoDialog> {
  List<dynamic> _tempSelectedOption = List();

  // ProposalSearchBloc proposalSearchBloc;
  List<String> requiredKey = List();

  @override
  void initState() {
    if (widget
        .selectedOptions.isNotEmpty /*&& widget.userProfileData != null*/) {
      widget.selectedOptions.forEach((selectedOptionName) {
        _tempSelectedOption.add(selectedOptionName);
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
          title: Text(
            this.widget.title,
            style: AppTheme.dialogDetailInfoStyle.copyWith(
                fontSize: 18.0,
                color: AppTheme.instituteTextColor,
                fontWeight: FontWeight.w800),
          ),
          //   contentPadding: const EdgeInsets.all(0.0),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Divider(),
              buildFlexible(),
              Divider(),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 10,
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                minWidth: 355,
                height: 50,
                color: AppTheme.instituteTextColor,
                child: Text(
                  "Save",
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.8),
                ),
                onPressed: () {
                  Navigator.pop(context, _tempSelectedOption);
                },
              ),
            ],
          ),
        ));
  }

  Flexible buildFlexible() {
    return Flexible(
      child: Container(
        width: sizeConfig.screenWidth * 0.8,
        height: sizeConfig.screenHeight * 0.5,
        child: buildDialogOptionList(),
      ),
    );
  }

  Container buildDialogContainer(dynamic selectedOption) {
    //print(selectedOption.runtimeType.toString());
    if (selectedOption is Activecountry) {
      return buildActiveCountryDialogContent(selectedOption);
    }
    if (selectedOption is Startdate) {
      return buildStartDateDialogContent(selectedOption);
    }
    if (selectedOption is Degree) {
      return buildStudyLevelDialogContent(selectedOption);
    }
  }

  Container buildActiveCountryDialogContent(Activecountry selectedOption) {
    return Container(
      child: Theme(
        data: ThemeData(unselectedWidgetColor: Color(0xffACACAC)),
        child: CheckboxListTile(
            activeColor: Colors.blue,
            controlAffinity: ListTileControlAffinity.leading,
            value: _tempSelectedOption.contains(selectedOption),
            title: Text(
              selectedOption.countryName,
            ),
            onChanged: (bool value) {
              if (value) {
                if (!_tempSelectedOption.contains(selectedOption)) {
                  setState(() {
                    _tempSelectedOption.add(selectedOption);
                  });
                }
              } else {
                if (_tempSelectedOption.contains(selectedOption)) {
                  setState(() {
                    _tempSelectedOption.removeWhere((dynamic option) =>
                        (option as Activecountry) == selectedOption);
                  });
                }
              }
              // widget.onSelectedOptionListChanged(_tempSelectedOption);
            }),
      ),
    );
  }

  Container buildStudyLevelDialogContent(Degree selectedOption) {
    return Container(
      child: Theme(
        data: ThemeData(unselectedWidgetColor: Color(0xffACACAC)),
        child: CheckboxListTile(
            activeColor: Colors.blue,
            controlAffinity: ListTileControlAffinity.leading,
            value: _tempSelectedOption.contains(selectedOption),
            title: Text(
              selectedOption.degreeName,
            ),
            onChanged: (bool value) {
              if (value) {
                if (!_tempSelectedOption.contains(selectedOption)) {
                  setState(() {
                    _tempSelectedOption.add(selectedOption);
                  });
                }
              } else {
                if (_tempSelectedOption.contains(selectedOption)) {
                  setState(() {
                    _tempSelectedOption.removeWhere(
                        (dynamic option) => (option as Degree) == selectedOption);
                  });
                }
              }
              // widget.onSelectedOptionListChanged(_tempSelectedOption);
            }),
      ),
    );
  }

  Container buildStartDateDialogContent(Startdate selectedOption) {
    return Container(
      child: Theme(
        data: ThemeData(unselectedWidgetColor: Color(0xffACACAC)),
        child: CheckboxListTile(
            activeColor: Colors.blue,
            controlAffinity: ListTileControlAffinity.leading,
            value: _tempSelectedOption.contains(selectedOption),
            title: Text(
              selectedOption.name,
            ),
            onChanged: (bool value) {
              if (value) {
                if (!_tempSelectedOption.contains(selectedOption)) {
                  setState(() {
                    _tempSelectedOption.add(selectedOption);
                  });
                }
              } else {
                if (_tempSelectedOption.contains(selectedOption)) {
                  setState(() {
                    _tempSelectedOption.removeWhere(
                        (dynamic option) => (option as Startdate) == selectedOption);
                  });
                }
              }
              // widget.onSelectedOptionListChanged(_tempSelectedOption);
            }),
      ),
    );
  }

  buildDialogOptionList() {
    print(widget.options.length.toString());
    return ListView.builder(
        shrinkWrap: true,
        itemCount: widget.options.length,
        itemBuilder: (BuildContext context, int index) {
          final optionForSelection = widget.options[index];
          return Column(
            children: <Widget>[
              buildDialogContainer(optionForSelection),
            ],
          );
        });
  }

}
