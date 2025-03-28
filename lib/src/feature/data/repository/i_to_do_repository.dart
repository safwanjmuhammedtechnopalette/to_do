import 'package:to_do/src/feature/data/model/to_do_model.dart';

abstract interface class IToDoRepository {
  Future<List<ToDoModel>?> getTodo();

  Future<void> addTodo();
}
