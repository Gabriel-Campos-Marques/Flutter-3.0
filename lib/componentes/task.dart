import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/componentes/difficulty.dart';

// ignore: must_be_immutable
class Task extends StatefulWidget {
  final String name;
  final int dificuldade;
  final String photo;

  Task({
    Key? key,
    required this.name,
    required this.dificuldade,
    required this.photo,
  }) : super(key: key);

  int nivel = 0;
  int maestria = 0;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {

  bool assetOrNetwork() {
    if (widget.photo.contains('http')) {
      return false;
    }
    return true;
  }

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
                color: (widget.maestria == 0)
                    ? Colors.blue
                    : (widget.maestria == 1)
                        ? Colors.green
                        : (widget.maestria == 2)
                            ? Colors.yellow
                            : (widget.maestria == 3)
                                ? Colors.red
                                : (widget.maestria == 4)
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
                          child: assetOrNetwork() ? Image.asset(
                            widget.photo,
                            fit: BoxFit.cover,
                          ) : Image.network(widget.photo, fit: BoxFit.cover,)
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
                                if (widget.maestria <= 6) {
                                  widget.nivel++;
                                  if (widget.nivel == nivelMaestria) {
                                    widget.maestria++;
                                    widget.nivel = 0;
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
                              ? (widget.nivel / widget.dificuldade) / 10
                              : 1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Nível: ${widget.nivel}',
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
