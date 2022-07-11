import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/componentes/task.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool visivel = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('Tarefas'),
      ),
      body: AnimatedOpacity(
        duration: const Duration(milliseconds: 800),
        opacity: (visivel == true) ? 0 : 1,
        child: ListView(
          children: const [
            Task(
              name: 'Aprender flutter',
              dificuldade: 3,
            ),
            Task(
              name: 'Ler',
              dificuldade: 5,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () {
          setState(() {
            visivel = !visivel;
          });
        },
      ),
    );
  }
}
