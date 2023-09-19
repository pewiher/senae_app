part of 'network_connectivity_bloc.dart';

@immutable
class NetworkConnectivityState {
  final bool online;
  const NetworkConnectivityState({
    this.online = false,
  });

  NetworkConnectivityState copyWith({
    bool? online,
  }) =>
      NetworkConnectivityState(
        online: online ?? this.online,
      );
}
