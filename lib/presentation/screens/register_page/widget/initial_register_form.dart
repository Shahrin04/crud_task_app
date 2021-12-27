import 'package:crud_task_app/logic/create_user_bloc/create_user_bloc.dart';
import 'package:crud_task_app/presentation/shared/constants.dart';
import 'package:flutter/material.dart';

class InitialRegisterForm extends StatefulWidget {
  final CreateUserBloc createUserBloc;

  const InitialRegisterForm({Key key, this.createUserBloc}) : super(key: key);

  @override
  State<InitialRegisterForm> createState() => _InitialRegisterFormState();
}

class _InitialRegisterFormState extends State<InitialRegisterForm> {
  final _formKey = GlobalKey<FormState>();

  String name = '';
  String job = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: height * 0.02,
        horizontal: width * 0.14,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: height * 0.025,
            ),
            TextFormField(
              decoration: textInputDecoration.copyWith(hintText: 'Name'),
              validator: (value) =>
                  value.isEmpty ? 'Please enter a Name' : null,
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
            ),
            SizedBox(height: height * 0.025),
            TextFormField(
              decoration: textInputDecoration.copyWith(hintText: 'Job'),
              validator: (value) =>
                  value.isEmpty ? 'Please enter your job name' : null,
              onChanged: (value) {
                setState(() {
                  job = value;
                });
              },
            ),
            SizedBox(height: height * 0.025),
            ElevatedButton(
              onPressed: () async {
                FocusScope.of(context).requestFocus(FocusNode());
                if (_formKey.currentState.validate()) {
                  widget.createUserBloc.add(CreateUser(name: name, job: job));
                }
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: Colors.pink.shade300,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
              ),
              child: const Text(
                'Register',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
