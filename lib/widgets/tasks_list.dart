import 'package:flutter/material.dart';
import 'package:todoey/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/tasks_data.dart';

import '../models/task.dart';

class TasksList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    /*
    List<TaskTile> tiles = [];
    for (Task t in tasks) tiles.add(TaskTile(taskDescription: t.name, checked: t.isDone));
    return ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        children: tiles
    );
    */

    return Consumer<TasksData>(
      builder: (context, tasksData, child) {
        return ListView.builder(
            itemBuilder: (context, index) {
              Task t = tasksData.getAt(index);
              return TaskTile(
                description: t.name,
                done: t.isDone,
                  //taskDescription: t.name,
                  //checked: t.isDone,
                  checkboxCallback: (bool? checkboxState) {
                    tasksData.toggleDone(t);
                  },
                deleteCallback: () {
                  tasksData.deleteAt(index);
                },
              );
            },
            itemCount: tasksData.totalCount
        );
      }
    );
  }
}