// import 'package:hive_flutter/hive_flutter.dart';

// class TodoDatabase{
//   List todoList=[];

//   //refrence the box
//   final _myBox=Hive.box('mybox');

//   //run this method if this is the 1st time ever opening the app
//   void createInitialData(){
//     todoList=[
//       ["Make Tutorial",false],
//     ["Do Exercise",false],
//     ];
//   }

//   //load the data from database
//   void loadData(){
//     todoList=_myBox.get("List");//key
//   }

//   //update database
//   void updateDatabase(){
//     _myBox.put("List", todoList);
//   }
// }