import 'package:bloc_demo/blocs/internet_bloc/internet_bloc.dart';
import 'package:bloc_demo/cubits/internet_cubit.dart';
import 'package:bloc_demo/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        //create: (context) => InternetBloc(),
        create: (context) => InternetCubit(),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
        ));
  }
}
