import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:todo_app/api_calls/models/todo_%20model.dart';
import 'package:todo_app/screens/todos/todos_controller.dart';
import 'package:todo_app/utils/constants/colors.dart';

import 'widget/floating_button.dart';
import 'widget/todo_list_widget.dart';

class TodosScreen extends StatelessWidget {
  const TodosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TodosController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Todos"),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : controller.todoList.isEmpty
                ? const Center(
                    child: Text("Sorry no Todos yet.....🥲"),
                  )
                : const ToDoListWidget(),
      ),
      floatingActionButton: const FloatingButtonWidget(),
    );
  }
}
