import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:to_do/src/app.dart';
import 'package:to_do/src/core/api_service/i_api_service.dart';
import 'package:to_do/src/core/app_config.dart';
import 'package:to_do/src/core/util/loader.dart';
part 'api_service.g.dart';

@riverpod
ApiService dio(Ref ref) {
  return ApiService();
}

class ApiService implements IApiService {
  //// Dio instance
  Dio get dio => _createDio();

  Dio _createDio() {
    return Dio(BaseOptions(baseUrl: AppConfig.baseUrl))
      ..interceptors.add(Int());
  }

  Future<Response> _request(
    Future<Response> Function() method, {
    bool showLoader = false,
  }) async {
    // Show loader before request starts
    try {
      if (showLoader && !navigatorKey.currentContext!.mounted) {
        Loader.show();
      }
      return await method();
    } finally {
      if (showLoader && !navigatorKey.currentContext!.mounted) {
        Loader.hide();
      }
    }
  }

  @override
  Future<Response> get({required String path, bool showLoader = false}) async {
    return await _request(() => dio.get(path), showLoader: showLoader);
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

class Int extends Interceptor {}
