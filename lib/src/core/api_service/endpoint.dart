class Endpoint {
  static const String getTodo = 'api/todo';
  static const String addTodo = 'api/todo/add';
  static const String updateTodo = 'api/todo/update';
  static String deleteTodo(int id) => 'api/todo/delete/$id';
}
