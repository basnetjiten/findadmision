import 'package:findadmissionaffiliate/models/student/std_load_data.dart';

class StdSelectedCourse {
  List<Selectedcoursearr> appliedCourseList = [];
  void addCourseToList(List<Selectedcoursearr> applyCourseDto) {
    appliedCourseList = applyCourseDto;
  }
}
