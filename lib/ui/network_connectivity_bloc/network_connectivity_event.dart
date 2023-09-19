part of 'network_connectivity_bloc.dart';

@immutable
abstract class NetworkConnectivityEvent {}

class NetworkConnectivityInitialEvent extends NetworkConnectivityEvent {}

class WatchNetworkConnectivityDataReceived extends NetworkConnectivityEvent {
  final bool isOnline;

  WatchNetworkConnectivityDataReceived(this.isOnline);
}
