import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:to_do/src/core/api_service/api_service.dart';
import 'package:to_do/src/core/api_service/endpoint.dart';
import 'package:to_do/src/core/api_service/i_api_service.dart';
import 'package:to_do/src/feature/data/repository/i_to_do_repository.dart';
part 'to_do_repository.g.dart';

@riverpod
IToDoRepository toDoRepository(Ref ref) {
  return ToDoRepository(ref.read(dioProvider));
}

class ToDoRepository implements IToDoRepository {
  ToDoRepository(this._apiService);
  final IApiService _apiService;

  final dio = Dio();

  @override
  Future<void> getTodo() async {
    try {
      final response = await dio.get("https://10.0.2.2/api/todo");
      print('response: ${response.data}');
    } catch (e) {
      print('xxxxxxxxx');
    }
  }

  @override
  Future<void> addTodo() {
    // TODO: implement addTodo
    throw UnimplementedError();
  }
}
