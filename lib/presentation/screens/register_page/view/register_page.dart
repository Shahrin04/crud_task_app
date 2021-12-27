import 'package:crud_task_app/logic/create_user_bloc/create_user_bloc.dart';
import 'package:crud_task_app/presentation/screens/register_page/widget/complete_reg.dart';
import 'package:crud_task_app/presentation/screens/register_page/widget/initial_register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  CreateUserBloc createUserBloc;

  @override
  void initState() {
    super.initState();
    createUserBloc = BlocProvider.of<CreateUserBloc>(context);
    createUserBloc.add(RegisterUser());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown.shade100,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Register Page'),
        ),
        body: BlocBuilder<CreateUserBloc, CreateUserState>(
            builder: (context, state) {
          if (state is UserLoading) {
            return const Center(
                child: SizedBox(
                    height: 25, width: 25, child: CircularProgressIndicator()));
          } else if (state is UserLoadComplete) {
            return const CompleteReg();
          }
          return InitialRegisterForm(createUserBloc: createUserBloc);
        }));
  }
}
