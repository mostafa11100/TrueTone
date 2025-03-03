import 'package:get_it/get_it.dart';
import 'package:truetone/core/network/api_dio.dart';

final sl = GetIt.instance;
setupLocator() {
  sl.registerSingleton(() => DioNetwork.init);
}
