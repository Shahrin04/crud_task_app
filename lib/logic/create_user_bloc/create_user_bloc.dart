import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crud_task_app/data/model/data_model.dart';
import 'package:crud_task_app/data/provider/data.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'create_user_event.dart';

part 'create_user_state.dart';

class CreateUserBloc extends Bloc<CreateUserEvent, CreateUserState> {
  Data data;

  CreateUserBloc({this.data}) : super(CreateUserInitial());

  @override
  Stream<CreateUserState> mapEventToState(CreateUserEvent event) async* {
    if (event is RegisterUser) {
      yield CreateUserInitial();
    } else if (event is CreateUser) {
      yield UserLoading();

      try {
        DataModel userData = await data.createUser(
            dataModel: DataModel(
                name: event.name.toString(), job: event.job.toString()));
        yield UserLoadComplete(userData);
      } on Exception catch (e) {
        print('CreateUser Bloc Error: ' + e.toString());
        yield UserNotLoaded();
      }
    }
  }
}
