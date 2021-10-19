import 'package:data_connection_checker/data_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
// bool get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final DataConnectionChecker connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  //@override
  // TODO: implement isConnected
  // bool get isConnected => true;



  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;



}