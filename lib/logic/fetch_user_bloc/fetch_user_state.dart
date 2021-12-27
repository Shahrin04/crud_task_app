part of 'fetch_user_bloc.dart';

@immutable
abstract class FetchUserState extends Equatable {}

class FetchUserInitial extends FetchUserState {
  @override
  List<Object> get props => [];
}

class UserLoading extends FetchUserState {
  @override
  List<Object> get props => [];
}

class UserNotLoaded extends FetchUserState {
  @override
  List<Object> get props => [];
}

class UserLoadComplete extends FetchUserState {
  final _getDataList;

  UserLoadComplete(this._getDataList);

  GetDataResponse get getDataList => _getDataList;

  @override
  List<Object> get props => [_getDataList];
}


