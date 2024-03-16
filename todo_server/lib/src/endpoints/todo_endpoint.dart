import 'package:serverpod/server.dart';
import 'package:todo_server/src/generated/protocol.dart';

class ToDoEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<void> create(Session session, String title, String description) async {
    final uid = (await session.auth.authenticatedUserId)!;

    final todo = ToDo(
        uid: uid, title: title, description: description, completed: false);

    await ToDo.db.insertRow(session, todo);
  }

  Future<void> markCompleted(Session session, int id) async {
    final uid = (await session.auth.authenticatedUserId)!;

    final todo = await ToDo.db.findById(session, id);

    if (todo == null || todo.uid != uid) {
      throw NotFoundException(message: "Data not found.");
    }

    if (todo.completed) {
      return;
    }

    todo.completed = true;

    await ToDo.db.updateRow(session, todo);
  }

  Future<void> delete(Session session, int id) async {
    final uid = (await session.auth.authenticatedUserId)!;

    await ToDo.db.deleteWhere(session,
        where: (ToDoTable table) =>
            table.uid.equals(uid) & table.id.equals(id));
  }

  Future<List<ToDo>> getAll(Session session) async {
    final uid = (await session.auth.authenticatedUserId)!;

    return ToDo.db
        .find(session, where: (ToDoTable table) => table.uid.equals(uid));
  }
}
