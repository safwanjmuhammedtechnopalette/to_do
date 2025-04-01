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
  Future<bool> addTodo({required String toDo}) async {
    final Object data = {"task": toDo};
    try {
      final response = await _apiService.post(
        path: Endpoint.addTodo,
        data: data,
      );
      if (response.statusCode == 200) return false;
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> upDateToDo({required int id, required bool isCompleted}) async {
    try {
      final object = {"id": id, "isCompleted": isCompleted};
      final response = await _apiService.put(
        path: Endpoint.updateTodo,
        data: object,
      );
      if (response.statusCode == 200) return true;
      return false;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> deleteToDo({required int id}) async {
    try {
      final response = await _apiService.delete(path: Endpoint.deleteTodo(id));
      print('Response: ${response.data}');
      if (response.statusCode == 200) return true;
      return false;
    } catch (e) {
      return false;
    }
  }
}
