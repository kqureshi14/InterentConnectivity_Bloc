import 'dart:async';

import 'package:bloc_demo/blocs/internet_bloc/internet_event.dart';
import 'package:bloc_demo/blocs/internet_bloc/internet_state.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final Connectivity connectivity = Connectivity();

  StreamSubscription? connectivitySubscription;

  InternetBloc() : super(InternetInitialState()) {
    on<InternetLostEvent>((event, emit) => emit(InternetLostState()));
    on<InternetConnectedEvent>((event, emit) => emit(InternetConnectedState()));

    connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen(((List<ConnectivityResult> result) {
      if (result.contains(ConnectivityResult.none)) {
        add(InternetLostEvent());
      } else {
        add(InternetConnectedEvent());
      }
    }));
  }

  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}
