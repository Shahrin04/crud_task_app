part of 'create_user_bloc.dart';

@immutable
abstract class CreateUserEvent extends Equatable {}

class RegisterUser extends CreateUserEvent {
  @override
  List<Object> get props => [];
}

class CreateUser extends CreateUserEvent {
  final name;
  final job;

  CreateUser({this.name, this.job});

  @override
  List<Object> get props => [name, job];
}
