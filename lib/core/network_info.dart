import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo{
  Future<bool> get isConnected;
}

class NetworkInfoImplementation implements NetworkInfo{
   InternetConnectionChecker connectionChecker = InternetConnectionChecker.instance;
  NetworkInfoImplementation({required this.connectionChecker});
  @override
  Future<bool> get isConnected async {
    // return true;
    final customChecker = InternetConnectionChecker.createInstance(
      slowConnectionConfig: SlowConnectionConfig(
        enableToCheckForSlowConnection: true,
        slowConnectionThreshold: const Duration(seconds: 1),
      ),
    )..checkInterval = const Duration(microseconds: 100);

    bool isConnected = await customChecker.hasConnection;
    return  isConnected;}
}


class NetworkInfoImplementation2 implements NetworkInfo {
  final InternetConnectionChecker connectionChecker;
  bool _lastKnownConnection = true; // Assume connected initially

  NetworkInfoImplementation2({required this.connectionChecker}) {
    _monitorConnection();
  }
  void _monitorConnection() {
    connectionChecker.onStatusChange.listen((status) {
      _lastKnownConnection = (status == InternetConnectionStatus.connected);
    });
  }

  @override
  Future<bool> get isConnected async {
    return _lastKnownConnection; // Use cached result instead of waiting
  }
}
