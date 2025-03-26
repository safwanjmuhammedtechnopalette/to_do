import 'package:dio/dio.dart';

abstract interface class IApiService {
  Future<Response> get({required String path});
  Future<Response> post({required String path, required Object data});
}
