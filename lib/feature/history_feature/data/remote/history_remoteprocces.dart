import 'package:dio/dio.dart';

abstract class  BaseRemoteHistory<Pramitar>
{
Future<Response>  fetch([Pramitar pr]);
Future<Response>  delet([Pramitar pr]);
}
class RemoteHistory extends BaseRemoteHistory
{
  @override
  Future<Response> delet([pr])
  {
    throw UnimplementedError();
  }

  @override
  Future<Response> fetch([pr]) {
    // TODO: implement fetch
    throw UnimplementedError();
  }}
