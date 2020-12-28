import 'package:findadmissionaffiliate/models/institute/institute_detail_page.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/institute_cards/partials/overview_partials/college_image_list.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/institute_cards/partials/overview_partials/college_overview_text.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/institute_cards/partials/overview_partials/college_video_list.dart';
import 'package:flutter/material.dart';

class OverviewSection extends StatelessWidget {
  final InstituteDetailRes institute;

  OverviewSection({this.institute});

  final sizedBox = const SizedBox(
    height: 15,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CollegeOverviewText(
          aboutText: institute.details.about,
          collegeName: institute.details.name,
        ),
        sizedBox,
        Offstage(
            offstage: institute.photos.isEmpty,
            child: CollegeImageList(photos: institute.photos)),
        sizedBox,
        Offstage(offstage: institute.videos.isEmpty, child: CollegeVideoList(videos:institute.videos)),
      ],
    );
  }
}
