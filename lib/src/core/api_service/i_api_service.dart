import 'package:dio/dio.dart';

abstract interface class IApiService {
  Future<Response> get({required String path, bool showLoader = false});
  Future<Response> post({required String path, required Object data});
  Future<Response> put({required String path, required Object data});
  Future<Response> delete({required String path});
}
