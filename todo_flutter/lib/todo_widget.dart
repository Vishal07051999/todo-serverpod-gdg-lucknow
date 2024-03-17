import 'package:flutter/material.dart';
import 'package:todo_client/todo_client.dart';

import 'config.dart';

class ToDoWidget extends StatelessWidget {
  final ToDo toDo;
  final VoidCallback refreshToDos;

  const ToDoWidget({super.key, required this.toDo, required this.refreshToDos});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue, // Set border color
          width: 2.0, // Set border width
        ),
        borderRadius: BorderRadius.circular(10.0), // Set corner radius
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    toDo.title,
                    style: const TextStyle(fontSize: 18.0),
                  ),
                  Text(toDo.description),
                ],
              ),
            ),
            Column(
              children: [
                Checkbox(
                    value: toDo.completed,
                    onChanged: toDo.completed
                        ? null
                        : (final _) {
                            client.toDo.markCompleted(toDo.id!).then((_) {
                              refreshToDos();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                duration: const Duration(milliseconds: 500),
                                content:
                                    Text("ToDo completed :- ${toDo.title}"),
                                backgroundColor: Colors.green,
                              ));
                            }).catchError((_) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                duration: Duration(milliseconds: 500),
                                content: Text("Unable to complete ToDo."),
                                backgroundColor: Colors.red,
                              ));
                            });
                          }),
                IconButton(
                  icon: const Icon(Icons.delete), // Set the icon to delete
                  onPressed: () {
                    client.toDo.delete(toDo.id!).then((_) {
                      refreshToDos();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: const Duration(milliseconds: 500),
                        content: Text("ToDo deleted :- ${toDo.title}"),
                        backgroundColor: Colors.green,
                      ));
                    }).catchError((_) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        duration: Duration(milliseconds: 500),
                        content: Text("Unable to delete ToDo."),
                        backgroundColor: Colors.red,
                      ));
                    });
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
