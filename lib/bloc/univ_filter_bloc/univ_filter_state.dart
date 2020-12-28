part of 'univ_filter_bloc.dart';

@immutable
abstract class UnivFilterState {}

class UnivFilterInitial extends UnivFilterState {}
class UnivDataFetched extends UnivFilterState {
  final UnivFilterResponse univFilterResponse;
  UnivDataFetched({this.univFilterResponse});
}
class UnivEmptyData extends UnivFilterState{}
