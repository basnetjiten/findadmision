part of 'std_funding_bloc.dart';

@immutable
abstract class StdFundingEvent {}
class StoreFundingInfoAndNext extends StdFundingEvent{
  final StepTwoFundingDto stepTwoFundingDto;
  final String stdId;
  StoreFundingInfoAndNext({this.stdId,this.stepTwoFundingDto});
}

class StoreFundingInfoAndSave extends StdFundingEvent{
  final StepTwoFundingDto stepTwoFundingDto;
  final String stdId;
  StoreFundingInfoAndSave({this.stdId,this.stepTwoFundingDto});
}
