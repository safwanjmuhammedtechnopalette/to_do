import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:to_do/src/core/util/app_snackbar.dart';
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

  Future<void> deleteToDo({required ToDoModel toDo}) async {
    List<ToDoModel> mutableList = List.from(state.value?.toDoList ?? []);
    int itemIndex = mutableList.indexWhere((element) => element.id == toDo.id);

    if (itemIndex == -1) return; // Item not found, do nothing

    ToDoModel removedItem = mutableList[itemIndex];

    mutableList.removeAt(itemIndex);
    update((state) => state.copyWith(toDoList: mutableList));

    final isDeleted = await ref
        .read(toDoRepositoryProvider)
        .deleteToDo(id: toDo.id ?? 0);

    if (!isDeleted) {
      //  If API fails, reinsert the item
      mutableList.insert(itemIndex, removedItem);
      update((state) => state.copyWith(toDoList: mutableList));
      AppSnackbar.show('Failed to delete');
    }
    AppSnackbar.show('Deleted successfully');
  }
}
