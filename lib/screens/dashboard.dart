import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/componentes/task.dart';
import 'package:nosso_primeiro_projeto/screens/form_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('Tarefas'),
      ),
      body: ListView(
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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FormScreen(),
            ),
          );
        },
      ),
    );
  }
}
