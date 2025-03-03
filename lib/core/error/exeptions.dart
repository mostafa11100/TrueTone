class ClientError implements Exception {
  String error;
  ClientError(this.error);
}

class ServerError implements Exception {
  String error;
  ServerError(this.error);
}
