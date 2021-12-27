import 'package:crud_task_app/data/model/data_model.dart';
import 'package:crud_task_app/data/model/get_data_model.dart';
import 'package:crud_task_app/data/model/get_data_response.dart';
import 'package:crud_task_app/logic/fetch_user_bloc/fetch_user_bloc.dart';
import 'package:crud_task_app/presentation/screens/home_page/widget/build_user_list.dart';
import 'package:crud_task_app/presentation/screens/register_page/view/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FetchUserBloc fetchUserBloc;

  @override
  void initState() {
    super.initState();
    fetchUserBloc = BlocProvider.of<FetchUserBloc>(context);
    fetchUserBloc.add(FetchUser());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[40],
      appBar: AppBar(
        title: const Text('CRUD APP'),
        actions: [
          TextButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, 'register_page');
              },
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: const Text('Create User',
                  style: TextStyle(color: Colors.white))),
        ],
      ),
      body:
          BlocBuilder<FetchUserBloc, FetchUserState>(builder: (context, state) {
        if (state is UserLoading) {
          return const Center(
              child: SizedBox(
                  height: 25, width: 25, child: CircularProgressIndicator()));
        } else if (state is UserLoadComplete) {
          return BuildUserList(data: state.getDataList,);
        }
        return const Center(
          child: Text('No User Found'),
        );
      }),
    );
  }

}
