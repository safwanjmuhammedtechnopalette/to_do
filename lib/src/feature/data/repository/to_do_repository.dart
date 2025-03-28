import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:to_do/src/core/api_service/api_service.dart';
import 'package:to_do/src/core/api_service/endpoint.dart';
import 'package:to_do/src/core/api_service/i_api_service.dart';
import 'package:to_do/src/feature/data/model/to_do_model.dart';
import 'package:to_do/src/feature/data/repository/i_to_do_repository.dart';
part 'to_do_repository.g.dart';

@riverpod
IToDoRepository toDoRepository(Ref ref) {
  return ToDoRepository(ref.read(dioProvider));
}

class ToDoRepository implements IToDoRepository {
  ToDoRepository(this._apiService);
  final IApiService _apiService;

  @override
  Future<List<ToDoModel>?> getTodo() async {
    try {
      final response = await _apiService.get(path: Endpoint.getTodo);
      if (response.statusCode != 200) return null;
      final data = response.data as List;
      return data.map((e) => ToDoModel.fromJson(e)).toList();
    } catch (e) {
      if (kDebugMode) print('Error: $e');
    }
    return null;
  }

  @override
  Future<void> addTodo() {
    // TODO: implement addTodo
    throw UnimplementedError();
  }
}
