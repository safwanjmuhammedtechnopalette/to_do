import 'package:to_do/src/feature/data/model/to_do_model.dart';

abstract interface class IToDoRepository {
  Future<List<ToDoModel>?> getTodo();

  Future<bool> addTodo({required String toDo});

  Future<bool> upDateToDo({required int id, required bool isCompleted});

  Future<bool> deleteToDo({required int id});
}
