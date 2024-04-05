import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetState { initial, lost, connected }

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity = Connectivity();

  StreamSubscription? connectivitySubscription;

  InternetCubit() : super(InternetState.initial) {
    connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen(((List<ConnectivityResult> result) {
      if (result.contains(ConnectivityResult.none)) {
        emit(InternetState.lost);
      } else {
        emit(InternetState.connected);
      }
    }));
  }

  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}
