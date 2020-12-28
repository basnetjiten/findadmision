part of 'univ_filter_bloc.dart';

@immutable
abstract class UnivFavFilterState {}

class UnivFavFilterInitial extends UnivFavFilterState {}
class UnivFavDataFetched extends UnivFavFilterState {
  final SavedUnivList savedUnivList;
  UnivFavDataFetched({this.savedUnivList});
}
class UnivFavEmptyData extends UnivFavFilterState{}
