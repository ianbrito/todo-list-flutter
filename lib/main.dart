import 'package:flutter/material.dart';
import 'package:todo_list/src/todo_pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List by Ian Brito',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: TodoList(),
      debugShowCheckedModeBanner: false,
    );
  }
}
