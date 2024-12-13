import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/screens/todos/todos_controller.dart';

import '../../../api_calls/models/todo_ model.dart';
import '../../../utils/constants/colors.dart';

class ToDoListWidget extends StatelessWidget {
  const ToDoListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = TodosController.instance;
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      shrinkWrap: true,
      itemCount: controller.todoList.length,
      itemBuilder: (context, index) {
        final TodoModel todo = controller.todoList[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius:
                BorderRadius.circular(20), // Match ListTile border radius
            child: Slidable(
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) => controller.delteTodoItem(index),
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                ],
              ),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                leading: Checkbox(
                  side: BorderSide.none,
                  checkColor: AppColors.accentOrange,
                  fillColor: WidgetStatePropertyAll(Colors.white),
                  value: todo.isCompleted,
                  onChanged: (value) =>
                      controller.checkBoxCallback(value ?? false, index),
                ),
                tileColor: const Color.fromARGB(255, 226, 226, 226),
                title: Text(
                  todo.title ?? "",
                  style: TextStyle(
                    decoration: todo.isCompleted ?? false
                        ? TextDecoration.lineThrough
                        : null,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryBlue,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  todo.description ?? "",
                  style: TextStyle(
                    decoration: todo.isCompleted ?? false
                        ? TextDecoration.lineThrough
                        : null,
                    fontSize: 14,
                    color: AppColors.primaryBlue,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () => controller.tileTapCallback(index),
              ),
            ),
          ),
        );
      },
    );
  }
}
