import 'package:get/get.dart';
import 'package:todo/modules/todo/todomodel.dart';

class TodoController extends GetxController {
  List todo = <Todolist>[].obs;
  void addTask(String title, bool status) {
    todo.add(Todolist(completed: status, title: title, id: todo.length + 1));
  }

  void deleteTask(int id) {
    todo.removeWhere((task) => task.id == id);
  }
}
