import 'dart:ui' as ui;   
import 'package:flutter/material.dart';
import 'package:todo/database_helper.dart';
import 'todo_add.dart';
import 'todo.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
List<Todo> todosList = [];
List<Todo> _foundToDo = [];
final _todoController = TextEditingController();

@override
void initState() {
  super.initState();
  _loadTasks();
}

void _loadTasks() async {
  final tasks = await DatabaseHelper.instance.getTasks();
  setState(() {
    todosList = tasks;
    _foundToDo = tasks;
  });
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(220, 196, 204, 204),
        appBar: _upAppBar(),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                children: [
                  searchBox(),
                  Expanded(
                    child:ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only( bottom: 20
                        ),
                      ),
                      for (Todo todo in _foundToDo)
                      TodoAdd(todo: todo,
                      onToDoChanged: _handleToDoChange,
                      onDeleteItem: _deleteToDoItem ),
                    ],
                  )
              )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(children: [
                Expanded(child: Container(
                  margin: EdgeInsets.only(right: 20, left: 20, bottom: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,borderRadius: BorderRadius.circular(15), 
                    boxShadow: const [BoxShadow(color: Colors.grey, offset: Offset(0.0, 0.0),
                    blurRadius: 10.0, spreadRadius: 0.0),]
                  ),
                  child: TextField(
                    controller: _todoController,
                    decoration: InputDecoration(
                      hintText: 'New TO-DO List...',
                      border: InputBorder.none
                    ),
                  ),
                )
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                  ),
                  child: ElevatedButton(onPressed: () {
                    _addToDoItem   (_todoController.text)    ;           
                  },child: Text('+', style:TextStyle(fontSize: 40,), ),
                   style: ElevatedButton.styleFrom(
                    minimumSize: ui.Size(60, 60) ,
                    elevation: 10,
                   ),
                  ),
                ),
              ],),
            )
          ],
        ),
      ),
    );
  }

void _handleToDoChange(Todo todo) async {
  todo.isDone = !todo.isDone;
  await DatabaseHelper.instance.updateTask(todo);

  setState(() {
    _foundToDo = List.from(todosList);
  });
}

void _deleteToDoItem(String id) async {
  await DatabaseHelper.instance.deleteTask(id);

  setState(() {
    todosList.removeWhere((item) => item.id == id);
    _foundToDo = todosList;
  });
}

void _addToDoItem(String todo) async {
  if (todo.isNotEmpty) {
    final newTask = Todo(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      todoText: todo,
    );
    await DatabaseHelper.instance.insertTask(newTask);
    setState(() {
      todosList.add(newTask);
      _foundToDo = todosList;
    });
  } else {
    print('Task cannot be empty');
  }
  _todoController.clear();
}

void _runFilter(String enteredKeyword){
  List<Todo> results = [];
  if(enteredKeyword.isEmpty){
    results = todosList;
  }
  else{
    results = todosList.where((item) => item.todoText.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
  }
  setState(() {
    _foundToDo = results;
  });
}

  AppBar _upAppBar() {
    return AppBar(
      
        title: Row(children: [
          Text('TO-DO List', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold ),
          ),
          ],),
        backgroundColor: Color.fromARGB(220, 196, 204, 204),// to do list del
        toolbarHeight: 100.0,
      );
  }

Widget searchBox(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15)
      ),
      child: TextField(
        onChanged: (value) => _runFilter(value),
      decoration: InputDecoration(
      contentPadding: EdgeInsets.all(0),
      prefixIconConstraints: BoxConstraints(
      maxHeight: 20, minWidth: 40
     ),
     prefixIcon: Icon(
      Icons.search, color: Colors.black, size: 25, 
      ),
      border: InputBorder.none,
      hintText: 'Search...'
     ),
    ),
  );
 }  
}