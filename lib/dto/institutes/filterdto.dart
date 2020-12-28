import 'package:findadmissionaffiliate/models/univ.dart';
import 'package:flutter/material.dart';

class FilterDto {
  List<Activecountry> locationFilter;
  List<Startdate> dateFilter;
  List<CitylistElement> cityFilter;
  List<Degree> degreeFilter;
  List<RangeValues> feeRange;

  FilterDto(
      this.locationFilter, this.cityFilter, this.dateFilter, this.degreeFilter,this.feeRange);
}
