import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:to_do/src/feature/data/model/to_do_model.dart';

part 'to_do_state.freezed.dart';

@freezed
abstract class ToDoState with _$ToDoState {
  factory ToDoState({
    @Default([]) List<ToDoModel> toDoList,
    @Default(false) bool isCompleted,
  }) = _ToDoState;
}
