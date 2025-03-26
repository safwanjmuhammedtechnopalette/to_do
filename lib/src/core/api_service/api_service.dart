import 'package:dio/dio.dart';
import 'package:to_do/src/core/api_service/i_api_service.dart';
import 'package:to_do/src/core/app_config.dart';

class ApiService implements IApiService {
  final dio = Dio();

  BaseOptions options = BaseOptions(baseUrl: AppConfig.baseUrl);

  @override
  Future<Response> get({required String path}) async {
    return await dio.get(path);
  }

  @override
  Future<Response> post({required String path, required Object data}) async {
    return dio.post(path, data: data);
  }
}
