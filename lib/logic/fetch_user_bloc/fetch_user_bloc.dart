import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crud_task_app/data/model/get_data_response.dart';
import 'package:crud_task_app/data/provider/data.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'fetch_user_event.dart';
part 'fetch_user_state.dart';

class FetchUserBloc extends Bloc<FetchUserEvent, FetchUserState> {
  Data data;
  FetchUserBloc({this.data}) : super(FetchUserInitial());

  @override
  Stream<FetchUserState> mapEventToState(FetchUserEvent event) async* {
    if(event is FetchUser){
      yield UserLoading();

      try {
        GetDataResponse getDataList = await data.fetchUser();
        yield UserLoadComplete(getDataList);
      } on Exception catch (e) {
        print('Fetch User Bloc Exception: '+e.toString());
        yield UserNotLoaded();
      }
    }
  }
}
