part of 'std_sec_edu_bloc.dart';

@immutable
abstract class StdSecEduEvent {}
class AddSecEdu extends StdSecEduEvent {
  final SaveSecEduDto saveSecEduDto;
  final stdId;

  AddSecEdu({this.stdId, this.saveSecEduDto});
}