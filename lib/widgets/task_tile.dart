import 'package:flutter/material.dart';

// import '../models/task.dart';
class TaskTile extends StatelessWidget {

  String description;
  bool done;
  Function (bool?)checkboxCallback;
  Function() deleteCallback;

  TaskTile({required this.description, required this.done, required this.checkboxCallback, required this.deleteCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        description,
        style: TextStyle(decoration: done ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: done,
        onChanged: checkboxCallback
      ),
      onLongPress: deleteCallback
    );
  }
}

