class ToDo{
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone=false,
  });

  static List<ToDo> todoList(){
    return [
      ToDo(id: '01',todoText: 'Morning Excercise', isDone: true),
      ToDo(id: '02',todoText: 'Cleaning Bedroom', isDone: true),
      ToDo(id: '03',todoText: 'Revision Work', isDone: true),
      ToDo(id: '04',todoText: 'Check Mails', ),
      ToDo(id: '05',todoText: 'Work in Flutter for 2 hrs', ),
      ToDo(id: '06',todoText: 'Entertainment', ),
      ToDo(id: '07',todoText: 'Write Diary', ),
      ToDo(id: '08',todoText: 'Listen Music', ),

    ];
  }

}