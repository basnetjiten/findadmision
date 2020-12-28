part of 'inst_detail_bloc.dart';

@immutable
abstract class InstDetailState {}

class InstDetailInitial extends InstDetailState {

}

class InstDetailFetched extends InstDetailState {
  final InstituteDetailRes instituteDetailRes;

  InstDetailFetched({this.instituteDetailRes});
}



class InstDetailError extends InstDetailState {}
