import 'package:flutter/material.dart';
import 'todo.dart';




class TodoAdd extends StatelessWidget {
  final Todo todo;
  final onToDoChanged;
  final onDeleteItem;
  const TodoAdd ({Key? key, required this.todo, required this.onToDoChanged, required this.onDeleteItem}):super(key:key);

   @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        tileColor: todo.isDone ? const Color.fromARGB(255, 136, 225, 34) : Colors.white,
        leading: Icon(todo.isDone? Icons.check_box : Icons.check_box_outline_blank,
        color: Colors.black, 
        ),
        title: Text(todo.todoText, style: TextStyle(fontSize: 16, 
      //   color: todo.isDone ? Colors.green : Colors.black, 
      // decoration: todo.isDone ? TextDecoration.lineThrough : null,
        color: Colors.black,
        decoration: todo.isDone? TextDecoration.lineThrough:null,
        ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            //  color: Colors.red,
            borderRadius: BorderRadius.circular(5)
          ),
          child: IconButton(onPressed: () {
            onDeleteItem(todo.id);
          }, icon: Icon(Icons.close), color: Colors.red, iconSize: 18,),
        ),
      ),
    );
  }
}