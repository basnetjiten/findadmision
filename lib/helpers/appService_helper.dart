import 'package:findadmissionaffiliate/dto/institutes/filterdto.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/institute_cards/colleges_list_card.dart';
import 'package:flutter/material.dart';

import '../univ_global.dart';

class AppServiceHelper {
  static queryParam(String uniqueCode) {
    return {
      "brandedurl": "affiliateapp",
      "fromweb": "false",
      "uniquecode": uniqueCode
    };
  }

  static List<Widget> onCountryFiltered(FilterDto filterDto) {
    List<Widget> tempCard = [];
print("LOCATION LIST"+filterDto.locationFilter.length.toString());
    if (filterDto.locationFilter.isNotEmpty) {
      univFilterResponse.match.forEach((element) {
        filterDto.locationFilter.forEach((activeCountry) {
          // print("country filter id" + activeCountry);
          if (element.countryid == activeCountry.countryId) {
            print("MATCHED UNIVERSITY" + element.name);

            tempCard.add(CollegeListCard(univMatch: element));

            // cardList=CollegeListCard(univMatch: element);

          }
        });
      });
    }
    if (filterDto.dateFilter.isNotEmpty) {
      univFilterResponse.match.forEach((element) {
        filterDto.dateFilter.forEach((startDate) {
          print("country filter id" + startDate.name);
          element.startlist.forEach((startMnth) {
            if (startMnth == startDate.name) {
              print("MATCHED UNIVERSITY" + element.name);

              tempCard.add(CollegeListCard(univMatch: element));
              // cardList=CollegeListCard(univMatch: element);
              //initialCollegeCards.reversed;
            }
          });
        });
      });
    }
    if (filterDto.cityFilter.isNotEmpty) {
      univFilterResponse.match.forEach((element) {
        filterDto.cityFilter.forEach((cityFilter) {
          // print("country filter id" + dateId);

          if (element.cityid == cityFilter.id) {
            tempCard.add(CollegeListCard(univMatch: element));
            // cardList=CollegeListCard(univMatch: element);
          }
        });
      });
      // initialCollegeCards.insertAll(0, filteredCollegeCards);
    }
    return tempCard;
  }
}
