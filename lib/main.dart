import 'package:crud_task_app/logic/create_user_bloc/create_user_bloc.dart';
import 'package:crud_task_app/logic/fetch_user_bloc/fetch_user_bloc.dart';
import 'package:crud_task_app/presentation/screens/home_page/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/provider/data.dart';
import 'presentation/screens/register_page/view/register_page.dart';

void main() {
  // Turning off Landscape Mode
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  // Turning off Landscape Mode

  runApp(MyApp(
    data: Data(),
  ));
}

class MyApp extends StatelessWidget {
  final Data data;

  const MyApp({Key key, this.data}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CreateUserBloc>(
            create: (context) => CreateUserBloc(data: data)),
        BlocProvider<FetchUserBloc>(
            create: (context) => FetchUserBloc(data: data)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.brown,
        ),
        routes: {
          'register_page': (context) => const RegisterPage(),
        },
        home: const HomePage(),
      ),
    );
  }
}
