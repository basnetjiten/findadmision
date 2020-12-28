import 'package:findadmissionaffiliate/models/institute/loaddata_label.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FundingSourceDropDown extends StatefulWidget {
  final Funding initialFunding;
  final List<Funding> funding;
  final ValueChanged<Funding> onFundingSelected;

  FundingSourceDropDown({
    this.initialFunding,
    this.funding,
    this.onFundingSelected,
  });

  @override
  _FundingSourceDropDownState createState() => _FundingSourceDropDownState();
}

class _FundingSourceDropDownState extends State<FundingSourceDropDown> {
  bool _autoValidate = false;
  Funding funding;


  @override
  void initState() {
    funding = widget.initialFunding;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //print("country list"+widget.countryList.length.toString());
    return Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.white),
        child: DropdownButtonFormField<Funding>(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          itemHeight: 55,
          elevation: 1,
          hint: Text(
            widget.funding[0].fundingName,
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
          style: TextStyle(color: Colors.black, fontSize: 15),
          isDense: false,
          isExpanded: true,
          iconSize: 24.0,
          iconEnabledColor: Colors.black,
          items: widget.funding.map((Funding funding) {
            return DropdownMenuItem<Funding>(
              value: funding,
              child: Container(
                child: Text(
                  funding.fundingName,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              funding = value;

              widget.onFundingSelected(value);
            });
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          value: funding ?? null,
          validator: (value) => value == null ? '' : null,
          decoration: InputDecoration(
            fillColor: Colors.transparent,
            errorMaxLines: 1,
            errorStyle: TextStyle(height: 0),
            hintText: widget.funding[0].fundingName,
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
              borderSide: BorderSide(width: 0, color: Colors.transparent),
            ),
          ),
        ));
  }

  Funding getFundingId(Funding fund) {
    Funding fund;
    widget.funding.forEach((funding) {
      if (fund.fundingId == funding.fundingId) {
        fund = funding;
      }
    });
    return fund;
  }

/*void getUserDefaultCourse(String userCourseCode) {
    widget.countryList.forEach((country) {
      if (country.countryShortcode == userCourseCode) {
        setState(() {
          countryName = country.countryName;
        });
        // widget.onCourseChange(country.fundingCourse);
      }
    });
  }*/
}
