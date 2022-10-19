import 'package:flutter/material.dart';
import 'package:todo2/task.dart';

class AddTask extends StatelessWidget {
  String addText ='';

AddTask({
  required this.addTak
});
final Function(Task) addTak ;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Add Task',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.pink[200],
                  ),
                ),
                TextField(
                  textAlign: TextAlign.center,
                  cursorColor: Colors.pink[200],
                  onChanged: (newText){
                    addText = newText;
                    print(newText);
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.pink[200]),
                  onPressed: (){
                    if(addText != ''){
                      addTak(Task(name: addText,isDone: false));
                     Navigator.pop(context);}
                  },
                  child: Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
