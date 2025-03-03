// ignore: file_names
class Failure {
  String? error;

  Failure.fromJson(String er) {
    switch (er) {
      case 'weak-password':
        error = "The password is too weak, please choose a stronger one.";
        break;
      case 'email-already-in-use':
        error = "This email is already in use.";
        break;
      case 'user-not-found':
        error = "No account found with this email.";
        break;
      case 'wrong-password':
        error = "Incorrect password, please try again.";
        break;
      case 'server error':
        error = "A server error occurred, please try again later.";
        break;
      case 'invalid-credential':
        error = "Invalid login credentials, please check and try again.";
        break;
      default:
        error = "An unexpected error occurred, please try again.";
        break;
    }
  }

  Failure.handleHttpError(int? statusCode) {
    switch (statusCode) {
      case 400:
        error = "Invalid request, please check the sent data.";
        break;
      case 401:
        error = "You need to log in to continue.";
        break;
      case 402:
        error = "Payment is required for this service.";
        break;
      case 403:
        error = "You do not have permission to access this content.";
        break;
      case 404:
        error = "Content not found, please check the URL.";
        break;
      case 408:
        error = "Request timeout, please try again.";
        break;
      case 409:
        error = "Request conflict, please check your data.";
        break;
      case 500:
        error = "Internal server error, please try again later.";
        break;
      case 502:
        error = "The server is currently unavailable, please try later.";
        break;
      case 503:
        error = "Service is unavailable now, please try later.";
        break;
      case 504:
        error = "Connection timeout with the server, please try again.";
        break;
      default:
        error = "An unexpected error occurred, please try again.";
        break;
    }
  }

  Failure.networkError() {
    error = "Please check your internet connection and try again.";
  }
}
