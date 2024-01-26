/// The `HomePage` class is a Flutter widget that displays a list of todos and includes a search box in
/// the app bar.


import 'package:flutter/material.dart';
import 'package:transition1/Models/todo.dart';
import 'package:transition1/Widgets/todo_items.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final todosList =ToDo.todoList();
  List<ToDo> _foundTodo=[];
  final _todoController=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    _foundTodo=todosList;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
              backgroundColor: Colors.amber[200],
      appBar: _builtAppBar(),
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                   child: Column(
            children: [
               searchBox(),
              Expanded(child: ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      top: 50,
                      bottom: 20
                    ),
                    child: const Text('All ToDos',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),),
                  ),
                  for(ToDo todoo in _foundTodo.reversed)
                  ToDoItem(todo: todoo,
                  onTodoChanges: _handleTodo,
                  onDeleteItem: _deleteTodoItem,),
                ],
              ))
            ],
                   ),
            ),
            Align(alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20,left: 20,right: 20),
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow:const [ BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0,0.0),
                        blurRadius: 10.0,
                        spreadRadius: 0.0
                      ),
                      ],
                      borderRadius: BorderRadius.circular(10)
                  
                    ) ,
                    child: TextField(
                      decoration: InputDecoration(hintText: 'Add a new todo item',
                      border: InputBorder.none),
                      controller: _todoController,
                    ),
                  ),
                  
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20,right: 20),
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow:const [ BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0,0.0),
                        blurRadius: 10.0,
                        spreadRadius: 0.0
                      ),
                      ],
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: IconButton(
                    onPressed: () {
                    _addtodoItem(_todoController.text);
                  },
                  icon: Icon(Icons.add),
                  color: Colors.amber,
                  iconSize: 30,
                  ),
                  // child: ElevatedButton(child: Text('+',style: TextStyle(fontSize: 40,
                  // color: Colors.amber),),
                  // onPressed: () {
                    
                  // },
                  // style: ElevatedButton.styleFrom(
                  //   backgroundColor: Colors.white,
                  // minimumSize: Size(60,60),
                  // elevation: 10),),
                )
              ],
            ),
            ),

          ],
        ),
    );
  }

  void _handleTodo(ToDo todo) {
    setState(() {
      todo.isDone=!todo.isDone;
    });
    
  }
  void _deleteTodoItem(String id){
    setState(() {
      todosList.removeWhere((item) => item.id==id);
    });
  }
  void _addtodoItem(String todo){
    setState(() {
      todosList.add(ToDo(id: DateTime.now().millisecondsSinceEpoch.toString(), todoText: todo));
      _todoController.clear();
    });
  }

  void _runSearch(String enteredKeyword){
    List<ToDo> results=[];
    if(enteredKeyword.isEmpty){
      results=todosList;
    }
    else{
      results=todosList.where((item) => item.todoText!.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
    }

    setState(() {
      _foundTodo=results;
    });

  }

  
  
  Widget searchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20)
      ),
      child:  TextField(
        onChanged: (value) => _runSearch(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(Icons.search,
          color: Color.fromARGB(255, 129, 127, 127),
          size: 20,),
          prefixIconConstraints: BoxConstraints(maxHeight: 20,
          minWidth: 25,),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: Color.fromARGB(255, 112, 110, 110))
        ),
      ),
    );
  }


  AppBar _builtAppBar() {
    return AppBar(
      backgroundColor: Colors.amber[300],
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/images/lg.png',
          scale: 2.5,
          color: Colors.black,),
          Container(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset('assets/images/profile.png'),
            ),
          )
        ],
      ));
  }
}





