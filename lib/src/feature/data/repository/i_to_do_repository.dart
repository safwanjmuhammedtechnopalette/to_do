abstract interface class IToDoRepository {
  Future<void> getTodo();

  Future<void> addTodo();
}
