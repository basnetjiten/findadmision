part of 'std_funding_bloc.dart';

@immutable
abstract class StdFundingState {}

class StdFundingInitial extends StdFundingState {}
class StdFundingStoredNext extends StdFundingState{}
class StdFundingStoredSave extends StdFundingState{}
class StdFundingError extends StdFundingState{}
