import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'network_connectivity_event.dart';
part 'network_connectivity_state.dart';

class NetworkConnectivityBloc extends Bloc<NetworkConnectivityEvent, NetworkConnectivityState> {
  StreamSubscription<bool>? _netStreamSubscription;

  NetworkConnectivityBloc() : super(const NetworkConnectivityState()) {
    on<NetworkConnectivityInitialEvent>(
      (event, emit) {},
    );
    on<WatchNetworkConnectivityDataReceived>(_onNetworkConnectivityChange);
  }

  void _onNetworkConnectivityChange(WatchNetworkConnectivityDataReceived event, Emitter<NetworkConnectivityState> emit) {
    emit(state.copyWith(
      online: event.isOnline,
    ));
  }
}
