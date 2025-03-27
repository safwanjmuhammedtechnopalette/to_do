import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:to_do/src/feature/controller/to_do_state.dart';
import 'package:to_do/src/feature/data/repository/to_do_repository.dart';

part 'to_do_controller.g.dart';

@Riverpod()
class ToDo extends _$ToDo {
  @override
  ToDoState build() {
    return ToDoState();
  }

  Future<void> fetchToDo() async {
    await ref.read(toDoRepositoryProvider).getTodo();
  }
}
