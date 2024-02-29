import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/NewTodo.dart';
import 'MainView.dart';
import 'data/TodoStorage.dart';

void main() {
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => TodoProvider()),
          ],
          child: const MyApp()
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/newTodo': (context) => const NewTodo()
      },

      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

