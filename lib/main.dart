import 'package:bloctest/app/modules/home/bloc/home_bloc.dart';
import 'package:bloctest/app/modules/login/bloc/bloc/login_bloc.dart';
import 'package:bloctest/app/modules/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/modules/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Estudando BloC',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => HomeBloc()),
          BlocProvider(create: (_) => LoginBloc()),
        ],
        child: HomePage(),
      ),
      routes: {
        '/login': (context) => const LoginPage(),
      },
    );
  }
}
