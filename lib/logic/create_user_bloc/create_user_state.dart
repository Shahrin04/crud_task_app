part of 'create_user_bloc.dart';

@immutable
abstract class CreateUserState extends Equatable {}

class CreateUserInitial extends CreateUserState {
  @override
  List<Object> get props => [];
}


class UserLoading extends CreateUserState {
  @override
  List<Object> get props => [];
}

class UserNotLoaded extends CreateUserState {
  @override
  List<Object> get props => [];
}

class UserLoadComplete extends CreateUserState {
  final _userData;

  UserLoadComplete(this._userData);

  DataModel get getUserData => _userData;

  @override
  List<Object> get props => [_userData];
}
