import 'package:flutter/material.dart';
import 'package:todo/Todo.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> todos = [
    Todo(title: 'Kutyát sétáltatni', description: '', isDone: true),
    Todo(title: 'Bevásárlás', description: 'Tejet, kenyeret, tojást vásárolni', isDone: true),
    Todo(title: 'Takarítás', description: 'Felmosni, porszívózni', isDone: false),
    Todo(title: 'Tanulás', description: 'Fizika, matekra felkészülni.', isDone: true),
  ];

  void reloadTodos() {
    notifyListeners();
  }

  List<Todo> getTodos() {
    return todos;
  }

  void addTodo(Todo todo) {
    todos.add(todo);
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
