import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/dto/institutes/chip_dselect_dto.dart';
import 'package:findadmissionaffiliate/models/univ.dart';
import 'package:flutter/material.dart';

class CityChip extends StatelessWidget {
  final List<CitylistElement> chipLabel;
  final ValueChanged<ChipDeselect> onChipDeSelect;

  CityChip({this.chipLabel, this.onChipDeSelect});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      alignment: WrapAlignment.start,
      runAlignment: WrapAlignment.start,
      spacing: 8.0,
      // gap between adjacent chips
      //runSpacing: 4.0, // gap between lines
      children: <Widget>[
        for (int i = 0; i < chipLabel.length; i++)
          if (chipLabel[i].name.isNotEmpty)
            Chip(
              deleteIcon: Icon(
                Icons.cancel,
                color: Colors.white,
              ),
              onDeleted: () {
                final chipDeselect = ChipDeselect();
                chipDeselect.index=i;
                chipDeselect.chipType=CitylistElement;

                //setState(() {
                onChipDeSelect(chipDeselect);
              },
              label: Text(
                chipLabel[i].name,
                style: AppTheme.chipStyle.copyWith(color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  side: BorderSide(
                    width: 0.5,
                    color: AppTheme.checkBoxCheckedColor,
                  )),
              backgroundColor: AppTheme.checkBoxCheckedColor,
            ),
      ],
    );
  }


}
