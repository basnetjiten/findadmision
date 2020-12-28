part of 'std_high_educ_bloc.dart';

@immutable
abstract class StdHighEducEvent {}

class AddHighEdu extends StdHighEducEvent {
  final SaveHighEduDto saveHighEduDto;
  final stdId;

  AddHighEdu({this.stdId, this.saveHighEduDto});
}
