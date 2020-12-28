part of 'std_other_edu_bloc.dart';

@immutable
abstract class StdOtherEduEvent {}
class AddOtherEdu extends StdOtherEduEvent {
  final SaveOtherEduDto saveOtherEduDto;
  final stdId;

  AddOtherEdu({this.stdId, this.saveOtherEduDto});
}