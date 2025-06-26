// ignore: file_names

import 'package:dio/dio.dart';

class Failure {
  String? error;

  Failure.gineralerror(String er) {
    switch (er) {
      default:
        error = "An unexpected error occurred, please try again.";
        break;
    }
  }

  Failure.handleHttpError(DioException diotype) {
    switch (diotype.type) {
      case DioExceptionType.sendTimeout:
        error = "🚀 Request send timeout! Please check your network and retry";
        break;
      case DioExceptionType.connectionTimeout:
        error = "Connection timeout! Check your internet and try again";
        break;
      case DioExceptionType.receiveTimeout:
        error = "Response timeout! The server took too long to respond";
        break;
      case DioExceptionType.badCertificate:
        error = "Security issue! The server certificate is not trusted";
        break;
      case DioExceptionType.badResponse:
        error = badresponse(diotype.response!);
        break;
      case DioExceptionType.cancel:
        error = "Request was canceled!";
        break;
      case DioExceptionType.connectionError:
        error =
            "No internet connection! Please check your network and try again.";
        break;
      case DioExceptionType.unknown:
        error = "Please check your internet connection and try again";
        break;
    }
  }

  Failure.networkError() {
    error = "Please check your internet connection and try again.";
  }
}

String badresponse(Response response) {
  Map<String, dynamic> message;
  try {
    print("in handle error ${response.data}");
    message = response.data;
  } catch (e) {
    message = {};
  }

  String error = "";
  print("in badddddddddd ${response.statusCode}");
  switch (response.statusCode) {
    case 400:
      error =
          message['message'] ?? "Invalid request, please check the sent data.";
      break;
    case 401:
      error = message['message'] ?? "You need to log in to continue.";
      break;
    case 402:
      error = message['message'] ?? "Payment is required for this service.";
      break;
    case 403:
      error =
          message['message'] ??
          "You do not have permission to access this content.";
      break;
    case 404:
      error = message['message'] ?? "Content not found, please check the URL.";
      break;
    case 408:
      error = message['message'] ?? "Request timeout, please try again.";
      break;
    case 409:
      error = message['message'] ?? "Request conflict, please check your data.";
      break;
    case 500:
      error =
          message['message'] ??
          "Internal server error, please try again later.";
      break;
    case 502:
      error =
          message['message'] ??
          "The server is currently unavailable, please try later.";
      break;
    case 503:
      error =
          message['message'] ?? "Service is unavailable now, please try later.";
      break;
    case 504:
      error =
          message['message'] ??
          "Connection timeout with the server, please try again.";
      break;
    default:
      error =
          message['message'] ??
          "An unexpected error occurred, please try again.";
      break;
  }
  return error;
}
