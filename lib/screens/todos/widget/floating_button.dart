import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/screens/todos/todos_controller.dart';

class FloatingButtonWidget extends StatelessWidget {
  const FloatingButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = TodosController.instance;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Obx(
          () => Flexible(
            child: AnimatedContainer(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10)),
              duration: const Duration(milliseconds: 300),
              width: controller.isAddingItem.value
                  ? MediaQuery.of(context).size.width * 0.75
                  : 0,
              curve: Curves.easeInOut,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: controller.formkey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (controller.nameController.text.isEmpty &&
                            controller.descriptionController.text.isNotEmpty) {
                          return "Cannot add a Note without a title";
                        }
                        return null;
                      },
                      controller: controller.nameController,
                      decoration: const InputDecoration(labelText: 'Title'),
                    ),
                    TextFormField(
                      controller: controller.descriptionController,
                      decoration:
                          const InputDecoration(labelText: 'Description'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        FloatingActionButton(
          onPressed: () => controller.toggleFloatingButton(),
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          child: Obx(() =>
              Icon(controller.isAddingItem.value ? Icons.check : Icons.add)),
        ),
      ],
    );
  }
}
