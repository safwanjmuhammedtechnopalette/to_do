import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:to_do/src/core/api_service/i_api_service.dart';
import 'package:to_do/src/core/app_config.dart';
part 'api_service.g.dart';

@riverpod
ApiService dio(Ref ref) {
  return ApiService();
}

class ApiService implements IApiService {
  final dio = Dio();

  // BaseOptions options = BaseOptions(baseUrl: AppConfig.baseUrl);

  @override
  Future<Response> get({required String path}) async {
    return await dio.request(path, options: Options(method: 'GET'));
  }

  @override
  Future<Response> post({required String path, required Object data}) async {
    return dio.post(path, data: data);
  }
}
