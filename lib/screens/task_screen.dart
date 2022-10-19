import 'package:flutter/material.dart';
import 'package:todo2/screens/add_task.dart';
import 'package:todo2/task.dart';

class TaskScreen extends StatefulWidget {
  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
 bool checkBoxValue = false;
 List <Task> toDo = [];
 void addTask(Task task){
   setState(() {
     toDo.add(task);
   });
 }
 void deleteTask(Task task){
   setState(() {
     toDo.remove(task);
   });
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[200],
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context)=> SingleChildScrollView(
                  child:Container(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: AddTask(addTak: addTask),
                  )
              )
            //AddTask(addTak: addTask),
          );
        },
        backgroundColor: Colors.pink[200],
        child: Icon(
            Icons.add,
          color: Colors.white,
        ),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Padding(
          padding:  EdgeInsets.only(top: 60,left: 30,bottom:30,right: 30),
          child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor:Colors.white ,
                radius: 30,
                child: Icon(
                  Icons.menu,
                  color: Colors.pink[200],
                  size: 30,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Todo',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                 toDo.length.toString()+' Tasks',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          ),
        ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.pink[50],
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40.0),
                  topLeft: Radius.circular(40.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                    itemCount: toDo.length,
                    itemBuilder: (context, index){
                      return ListTile(
                        leading: Text(
                          toDo[index].name,
                          style: TextStyle(decoration: toDo[index].isDone ? TextDecoration.lineThrough : null),
                        ),
                        trailing: Checkbox(
                          fillColor:MaterialStateProperty.all(Colors.black45),
                          checkColor: Colors.black54,
                          value: toDo[index].isDone,
                            onChanged: (value) {
                          setState(() {
                      toDo[index].isDone = value  ?? false;
                             });
                            print(checkBoxValue);
                             },
                        ),
                        onLongPress: (){
                          deleteTask(toDo[index]);
                        },
                      );
                }),
              ),
            ),
          ),
      ],
      ),
    );
  }
}
