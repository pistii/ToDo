import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Todo.dart';
import 'data/TodoStorage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key : key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late TodoProvider todoStorage;
  late List<Todo> todos;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    TodoProvider todoProvider = TodoProvider();
    todos = todoProvider.getTodos();
  }
  /*
  pass data to other route:
  Navigator.pushReplacementNamed(context, path, arguments {map data.....})
  //Get the data:
  Map data = ModelRoute.of(context).settings.arguments;
   */

  @override
  Widget build(BuildContext context) {
    todos = context.watch<TodoProvider>().getTodos();

    return Scaffold(
      appBar: AppBar(title: const Text('Todo app')),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(todos[index].title),
              subtitle: Text(todos[index].description ?? ''),
              trailing: Checkbox(
                onChanged: (bool? value) {
                  setState(() {
                    print('pressed btn');
                    todos[index].isDone = !todos[index].isDone!;
                  });
                },
                value: todos[index].isDone,
                tristate: true,
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/newTodo');
          },
          child: const Icon(Icons.add)
      ),
    );
  }
}
