import 'package:findadmissionaffiliate/dto/institutes/courses.dart';

class SelectedCourse {
  List<ApplyCourseDto> appliedCourseList = [];

  void addCourseToList(List<ApplyCourseDto> applyCourseDto) {
    //appliedCourseList.clear();
    appliedCourseList=applyCourseDto;
  }
}
