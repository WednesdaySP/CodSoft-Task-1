import 'package:flutter/material.dart';
import 'package:transition1/Models/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onTodoChanges;
  final onDeleteItem;
  const ToDoItem({super.key, required this.todo, required this.onTodoChanges, required this.onDeleteItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          // print("Checked");
          onTodoChanges(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        tileColor: Colors.amber,
        leading: Icon( todo.isDone? Icons.check_box: Icons.check_box_outline_blank,color: Colors.white,),
        title: Text(todo.todoText!,style: TextStyle(
          fontSize: 16,
          color: Colors.black,
          decoration:todo.isDone? TextDecoration.lineThrough:null
        ),),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 8),
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5)
          ),
          child: IconButton(color: Colors.red,
          iconSize: 18,
          icon: Icon(Icons.delete),
          onPressed: () {
            // print('Deleted');
            onDeleteItem(todo.id);
          },),
        ),
      ),
    );
  }
}