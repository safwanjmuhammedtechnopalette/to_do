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
  //// Dio instance
  Dio get dio => _createDio();

  _createDio() {
    return Dio(BaseOptions(baseUrl: AppConfig.baseUrl));
  }

  @override
  Future<Response> get({required String path}) async {
    return await dio.request(path, options: Options(method: 'GET'));
  }

  @override
  Future<Response> post({required String path, required Object data}) async {
    return await dio.request(
      path,
      options: Options(method: 'POST'),
      data: data,
    );
  }

  @override
  Future<Response> put({required String path, required Object data}) async {
    return await dio.put(path, data: data);
  }

  @override
  Future<Response> delete({required String path}) async {
    return await dio.delete(path);
  }
}
