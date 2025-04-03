import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:to_do/src/core/util/app_snackbar.dart';
import 'package:to_do/src/feature/controller/to_do_state.dart';
import 'package:to_do/src/feature/data/model/to_do_model.dart';
import 'package:to_do/src/feature/data/repository/i_to_do_repository.dart';
import 'package:to_do/src/feature/data/repository/to_do_repository.dart';
part 'to_do_controller.g.dart';

@Riverpod()
class ToDo extends _$ToDo {
  IToDoRepository get _notifier => ref.read(toDoRepositoryProvider);

  @override
  FutureOr<ToDoState> build() async {
    final data = await _fetchTodo();
    return ToDoState(toDoList: data);
  }

  Future<List<ToDoModel>> _fetchTodo() async {
    final todo = await _notifier.getTodo();
    return todo ?? [];
  }

  Future<bool> addToDo({required String toDo}) async {
    final isSubmitted = await _notifier.addTodo(toDo: toDo);
    return isSubmitted;
  }

  Future<void> updateToDo({required int id}) async {
    // Find current item and toggle its status in UI immediately.
    List<ToDoModel> updatedList = List.from(state.value?.toDoList ?? []);
    int itemIndex = updatedList.indexWhere((item) => item.id == id);

    if (itemIndex == -1) return; // Item not found

    // Toggle status
    updatedList[itemIndex].isCompleted =
        !(updatedList[itemIndex].isCompleted ?? false);

    // Update UI optimistically
    update((state) => state.copyWith(toDoList: updatedList));

    try {
      // Call API with new status
      bool success = await _notifier.upDateToDo(
        id: id,
        isCompleted: updatedList[itemIndex].isCompleted ?? false,
      );

      if (!success) throw Exception('Update failed');
    } catch (e) {
      // Revert the change if API call fails
      updatedList[itemIndex].isCompleted =
          !(updatedList[itemIndex].isCompleted ?? false);
      update((state) => state.copyWith(toDoList: updatedList));

      // Show error message
      AppSnackbar.show('Failed to update');
    }
  }

  Future<void> deleteToDo({required ToDoModel toDo}) async {
    List<ToDoModel> mutableList = List.from(state.value?.toDoList ?? []);
    int itemIndex = mutableList.indexWhere((element) => element.id == toDo.id);

    if (itemIndex == -1) return; // Item not found, do nothing

    ToDoModel removedItem = mutableList[itemIndex];

    mutableList.removeAt(itemIndex);
    update((state) => state.copyWith(toDoList: mutableList));

    final isDeleted = await _notifier.deleteToDo(id: toDo.id ?? 0);

    if (!isDeleted) {
      //  If API fails, reinsert the item
      mutableList.insert(itemIndex, removedItem);
      update((state) => state.copyWith(toDoList: mutableList));
      AppSnackbar.show('Failed to delete');
    }
    AppSnackbar.show('Deleted successfully');
  }
}
