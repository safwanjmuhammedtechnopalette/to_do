class ToDoModel {
  int? id;
  String? task;
  bool? isCompleted;
  ToDoModel({this.id, this.task, this.isCompleted});

  factory ToDoModel.fromJson(Map<String, dynamic> str) => ToDoModel(
    id: str["id"],
    task: str["task"],
    isCompleted: str["isCompleted"],
  );
}
