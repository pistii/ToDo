import 'package:flutter/material.dart';
import 'package:todo/Todo.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> todos = [
    Todo(title: 'Kutyát sétáltatni', description: '', isDone: true),
    Todo(title: 'Bevásárlás', description: 'Tejet, kenyeret, tojást vásárolni', isDone: true),
    Todo(title: 'Takarítás', description: 'Felmosni, porszívózni', isDone: false),
    Todo(title: 'Tanulás', description: 'Fizika, matekra felkészülni.', isDone: true),
  ];

  deleteTodo(index)
  {
    if (index >= 0 && index < todos.length) {
      if (todos.contains(todos[index])) {
        todos.removeAt(index);
        notifyListeners();
      } else {
        print('A todo az adott indexen nem létezik.');
      }
    } else {
      print('Érvénytelen index: $index');
    }
  }

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
