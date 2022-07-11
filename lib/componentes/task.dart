import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/componentes/difficulty.dart';

class Task extends StatefulWidget {
  final String name;
  final int dificuldade;

  const Task({
    Key? key,
    required this.name,
    required this.dificuldade,
  }) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;
  int maestria = 0;

  @override
  Widget build(BuildContext context) {
    double nivelMaestria = (widget.dificuldade / 10) * 100;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Container(
              height: 143,
              decoration: BoxDecoration(
                color: (maestria == 0)
                    ? Colors.blue
                    : (maestria == 1)
                        ? Colors.green
                        : (maestria == 2)
                            ? Colors.yellow
                            : (maestria == 3)
                                ? Colors.red
                                : (maestria == 4)
                                    ? Colors.black
                                    : Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Column(
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 72,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black26,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'images/Eu7m692XIAEvxxP.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.name,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 24),
                            ),
                            Difficulty(
                              difficultyLevel: widget.dificuldade,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 52,
                          width: 70,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (maestria <= 6) {
                                  nivel++;
                                  if (nivel == nivelMaestria) {
                                    maestria++;
                                    nivel = 0;
                                  }
                                }
                              });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Icon(Icons.arrow_drop_up),
                                Text(
                                  'Lvl UP',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 200,
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: (widget.dificuldade > 0)
                              ? (nivel / widget.dificuldade) / 10
                              : 1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Nível: $nivel',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
