import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Todo.dart';
import 'data/TodoStorage.dart';

class NewTodo extends StatefulWidget {
  const NewTodo({super.key});

  @override
  State<NewTodo> createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Back'),
      ),
      body: const NewForm()
    );
  }
}

class NewForm extends StatefulWidget {
  const NewForm({super.key});

  @override
  State<NewForm> createState() => _NewFormState();
}

class _NewFormState extends State<NewForm> {
  final title = TextEditingController();
  final description = TextEditingController();
  TodoProvider todoStorage = TodoProvider();
  bool todoAddSuccessful = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(12.0,4.0,12.0,4.0),
          child: Card(
            child: TextField(
              controller: title,
              decoration: const InputDecoration(
                  labelText: 'title',
                  border: OutlineInputBorder()
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(12.0,4.0,12.0,4.0),
          child: Card(
            child: TextField(
              controller: description,
              decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder()
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                child: const Text('OK'),
                onPressed: () {
                setState(() {

                if (title.text != "") {
                  Todo todo = Todo(
                      title: title.text,
                      description: description.text,
                      isDone: false);
                  Provider.of<TodoProvider>(context, listen: false).addTodo(todo);
                  todoAddSuccessful = true;
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: //Text(Provider.of<TodoProvider>(context, listen: false).getTodos().length.toString()),
                      Text(todoAddSuccessful == true ? 'Todo hozzáadva' : 'Cím hozzáadása kötelező.'),
                      duration: const Duration(milliseconds: 3000),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  );
                });
            })
          ]
        )
      ],
    );
  }
}

