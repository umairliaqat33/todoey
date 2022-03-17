import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/tasks_data.dart';

class AddTaskScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20)
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget> [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: Colors.lightBlueAccent
              )
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                Provider.of<TasksData>(context, listen: false).setNextTaskDescription(newText);
              }
            ),
            TextButton(
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white
                )
              ),
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all<Color>(Colors.lightBlueAccent),
              ),
              onPressed: () {
                Provider.of<TasksData>(context, listen: false).addTask();
                Navigator.pop(context);
              },
            )
          ]
        )
      )
    );
  }

}