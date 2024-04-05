import 'package:bloc_demo/blocs/internet_bloc/internet_bloc.dart';
// import 'package:bloc_demo/blocs/internet_bloc/internet_state.dart';
import 'package:bloc_demo/cubits/internet_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: BlocConsumer<InternetCubit, InternetState>(
        listener: (context, state) {
          if (state == InternetState.connected) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Internet connected'),
                backgroundColor: Colors.green,
              ),
            );
          } else if (state == InternetState.lost) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Internet is connected'),
              backgroundColor: Colors.red,
            ));
          }
        },
        builder: (context, state) {
          if (state == InternetState.lost) {
            return const Text('No Internet');
          } else if (state == InternetState.connected) {
            return const Text('Connected!');
          } else {
            return const Text('Loading...');
          }
        },
      ),
    )));
  }
}
