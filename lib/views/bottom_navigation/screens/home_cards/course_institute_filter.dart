import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/models/univ.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CourseInstituteFilter extends StatefulWidget {
  CourseInstituteFilter({
    this.options,
    this.selectedOptions,
    this.onSelectedOptionListChanged,
  });

  final List<Degree> options;
  final List<Degree> selectedOptions;
  final ValueChanged<List<Degree>> onSelectedOptionListChanged;

  @override
  CourseInstituteFilterState createState() => CourseInstituteFilterState();
}

class CourseInstituteFilterState extends State<CourseInstituteFilter> {
  List<Degree> _tempSelectedOption = [];

  bool chipSelected = false;

  _buildChoiceList() {
    List<Widget> choices = List();
    widget.options.forEach((item) {
      int maxIndex = widget.options.indexOf(item);
      if (maxIndex < 4) {
        chipSelected = _tempSelectedOption.contains(item);
        choices.add(Container(
          padding: const EdgeInsets.all(2.0),
          child: ChoiceChip(
            avatar: chipSelected
                ? Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 15,
                  )
                : null,
            selectedColor: AppTheme.checkBoxCheckedColor,
            backgroundColor: Colors.white,
            shape: chipSelected
                ? RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  )
                : RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    side: BorderSide(
                      width: 0.5,
                      color: AppTheme.checkBoxCheckedColor,
                    )),
            label: Text(
              item.degreeName,
              style: chipSelected
                  ? TextStyle(color: Colors.white)
                  : TextStyle(color: AppTheme.checkBoxCheckedColor),
            ),
            selected: chipSelected,
            onSelected: (bool selected) {
              if (!_tempSelectedOption.contains(item)) {
                setState(() {
                  _tempSelectedOption.add(item);
                  chipSelected = selected;
                });
              } else {
                if (_tempSelectedOption.contains(item)) {
                  setState(() {
                    _tempSelectedOption
                        .removeWhere((Degree option) => option == item);
                  });
                }
              }
              widget.onSelectedOptionListChanged(_tempSelectedOption);
            },
          ),
        ));
      }
    });
    return choices;
  }

  @override
  void initState() {
    if (widget.selectedOptions.isNotEmpty) {
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
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}
