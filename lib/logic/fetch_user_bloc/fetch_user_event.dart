part of 'fetch_user_bloc.dart';

@immutable
abstract class FetchUserEvent extends Equatable {}

class FetchUser extends FetchUserEvent{
  @override
  List<Object> get props => [];

}
