// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

enum NetworkStatus { Online, Offline }

class NetworkStatusService {
  StreamController<NetworkStatus> networkStatusController =
      StreamController<NetworkStatus>();

  NetworkStatusService() {
    Connectivity().onConnectivityChanged.listen((status) {
      networkStatusController.add(_getNetworkStatus(status));
    });
  }

  NetworkStatus _getNetworkStatus(List<ConnectivityResult> status) {
    return status.any((element) => element == ConnectivityResult.mobile || element == ConnectivityResult.wifi)
      ? NetworkStatus.Online
      : NetworkStatus.Offline;
  }
}
