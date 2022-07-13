import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/componentes/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  final List<Task> taskList = [
     Task(
      name: 'Aprender flutter',
      dificuldade: 3,
      photo: 'images/Eu7m692XIAEvxxP.png',
    ),
     Task(
      name: 'Ler',
      dificuldade: 5,
      photo: 'images/Eu7m692XIAEvxxP.png',
    ),
  ];

  void newTask(String name, String photo, int difficulty) {
    taskList.add(
      Task(name: name, dificuldade: difficulty, photo: photo),
    );
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
