import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers.dart';
import 'todomodel.dart';

class Todoview extends StatefulWidget {
  const Todoview({
    super.key,
    this.title,
  });
  final title;
  @override
  State<Todoview> createState() => _TodoviewState();
}

List<Todolist> todolist = [];
final tittleController = TextEditingController();
final TodoController todoController = Get.put(TodoController());
bool _checked = false;

class _TodoviewState extends State<Todoview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 3, 34, 88),
        centerTitle: true,
      ),
      body: Obx(
        () => ListView.builder(
            itemCount: todoController.todo.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  title: Text(
                    todoController.todo[index].title,
                    style: TextStyle(
                        decoration: todoController.todo[index].completed
                            ? TextDecoration.lineThrough
                            : null),
                  ),
                  leading: Checkbox(
                    value: todoController.todo[index].completed,
                    onChanged: (value) {
                      todoController.updateTask(todoController.todo[index].id, _checked);
                    },
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        todoController.deleteTask(todoController.todo[index].id);
                      },
                      icon: const Icon(Icons.delete)),
                ),
              );
            }),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child:
               TextFormField(
                controller: tittleController,
                decoration: const InputDecoration(
                  hintText: 'Type something...',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: IconButton(
                    onPressed: () {
                      if (tittleController.text.isNotEmpty) {
                        todoController.addTask(tittleController.text, false);
                        tittleController.clear();
                      }
                    },
                    icon: const Icon(Icons.add)))
          ],
        ),
      ),
    );
  }
}
