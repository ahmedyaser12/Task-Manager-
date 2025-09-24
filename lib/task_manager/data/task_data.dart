class TaskModel {
  int id;
  String title;
  bool isDone;
  TaskModel({required this.id, required this.title, required this.isDone});
}

class TaskData {
  final List<TaskModel> _tasks = [
    TaskModel(id: 1, title: 'Review Clean Architecture', isDone: false),
    TaskModel(id: 2, title: 'Complete Flutter assignment', isDone: false),
    TaskModel(id: 3, title: 'Practice Widget Catalog', isDone: false),
  ];

  List<TaskModel> getTasks() => _tasks;
}

class TaskController {
  final List<TaskModel> tasks;

  TaskController(this.tasks); // Constructor to accept the task list

  void markTaskDone(int id) {
    tasks[id].isDone = true;
  }

  void markTaskUndone(int id) {
    tasks[id].isDone = false;
  }

  void deleteTask(int id) {
    tasks.removeAt(id);
  }

  void addTask(TaskModel task, int index) {
    tasks.insert(index, task);
  }
}
