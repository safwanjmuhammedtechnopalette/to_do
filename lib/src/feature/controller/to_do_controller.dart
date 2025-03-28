import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:to_do/src/feature/controller/to_do_state.dart';
import 'package:to_do/src/feature/data/model/to_do_model.dart';
import 'package:to_do/src/feature/data/repository/to_do_repository.dart';

part 'to_do_controller.g.dart';

@Riverpod()
class ToDo extends _$ToDo {
  @override
  FutureOr<ToDoState> build() async {
    final data = await _fetchTodo();
    return ToDoState(toDoList: data);
  }

  Future<List<ToDoModel>> _fetchTodo() async {
    final todo = await ref.read(toDoRepositoryProvider).getTodo();
    return todo ?? [];
  }

  Future<bool> addToDo({required String toDo}) async {
    final isSubmitted = await ref
        .read(toDoRepositoryProvider)
        .addTodo(toDo: toDo);
    return isSubmitted;
  }

  Future<bool> upDateToDo({required int id, required bool isCompleted}) async {
    final isUpdated = await ref
        .read(toDoRepositoryProvider)
        .upDateToDo(id: id, isCompleted: isCompleted);
    return isUpdated;
  }
}
