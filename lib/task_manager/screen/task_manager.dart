import 'package:flutter/material.dart';
import 'package:interactive_dismissible_list/task_manager/data/task_data.dart';

class TaskManager extends StatefulWidget {
  const TaskManager({super.key});

  @override
  TaskManagerState createState() => TaskManagerState();
}

class TaskManagerState extends State<TaskManager> {
  List<TaskModel> tasks = TaskData().getTasks();
  late TaskController taskController;

  @override
  void initState() {
    taskController = TaskController(tasks);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task Manager'), centerTitle: true),
      body: ReorderableListView(
        buildDefaultDragHandles: false,
        children: [
          for (int index = 0; index < tasks.length; index++)
            Dismissible(
              key: ValueKey(
                tasks[index].id,
              ), // Use unique task ID instead of the object
              direction: DismissDirection.endToStart,
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20),
                child: const Icon(Icons.delete, color: Colors.white, size: 32),
              ),
              confirmDismiss: (DismissDirection direction) async {
                // Show dialog and return the result
                return await deleteTaskDialog(context, tasks[index], index);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: Card(
                  child: ListTile(
                    key: ValueKey(
                      tasks[index].id,
                    ), // Use unique task ID for ListTile too
                    leading: ReorderableDragStartListener(
                      index: index,
                      child: Icon(Icons.drag_handle),
                    ),
                    title: Text(
                      tasks[index].title,
                      style: tasks[index].isDone
                          ? const TextStyle(
                              decoration: TextDecoration.lineThrough,
                            )
                          : null,
                    ),
                    trailing: Checkbox(
                      value: tasks[index].isDone,
                      onChanged: (_) {
                        setState(() {
                          if (tasks[index].isDone) {
                            taskController.markTaskUndone(index);
                          } else {
                            taskController.markTaskDone(index);
                          }
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
        ],
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final TaskModel item = tasks.removeAt(oldIndex);
            tasks.insert(newIndex, item);
          });
        },
      ),
    );
  }

  void openSnackBar(BuildContext context, TaskModel task, int index) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Task "${task.title}" deleted!'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            // Hide snackbar first, then restore the task
            setState(() {
              taskController.addTask(task, index);
            });
          },
        ),
      ),
    );
  }

  Future<bool?> deleteTaskDialog(
    BuildContext context,
    TaskModel task,
    int index,
  ) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Confirm Delete',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Text('Delete "${task.title}"?'),
        actions: [
          TextButton(
            onPressed: () =>
                Navigator.pop(context, false), // Return false to cancel
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              setState(() {
                taskController.deleteTask(index); // Use index, not task.id-1
              });
              Navigator.pop(context, true); // Return true to confirm deletion
              openSnackBar(
                context,
                task,
                index,
              ); // Show snackbar with undo option
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
