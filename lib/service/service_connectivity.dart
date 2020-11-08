part of 'service.dart';


class ConnectionService {
    
    static final ConnectionService _singleton = ConnectionService._internal();
    ConnectionService._internal();

    static ConnectionService getInstance() => _singleton;

    bool hasConnection = false;

    StreamController connectionChangeController = StreamController.broadcast();

    final Connectivity _connectivity = Connectivity();

    void initialize() {
      _connectivity.onConnectivityChanged.listen(_connectionChange);
      checkConnection();
    }

    Stream get connectionChange => connectionChangeController.stream;

    void dispose() {
      connectionChangeController.close();
    }

    void _connectionChange(ConnectivityResult result) {
      checkConnection();
    }

  Future<bool> checkConnection() async {
    final bool previousConnection = hasConnection;

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        hasConnection = true;
      } else {
        hasConnection = false;
      }
    } on SocketException catch(_) {
      hasConnection = false;
    }

    if (previousConnection != hasConnection) {
      connectionChangeController.add(hasConnection);
    }

    return hasConnection;
  }
}