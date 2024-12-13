import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/screens/todos/todos_controller.dart';
import 'package:todo_app/utils/constants/colors.dart';

/// Ui for No Internet widget
class DescriptionDialog extends StatelessWidget {
  final int index;
  const DescriptionDialog({super.key, required this.index});
  static const noInternetWidgetKey = Key('no-internet-widget-key');

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TodosController>();

    return Dialog(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 400),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: AppColors.lightOrange,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      "Description",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Form(
                    key: controller.dialogFormKey,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: controller.dialogTitleController,
                              decoration: const InputDecoration(
                                labelText: "Title",
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (controller
                                    .dialogTitleController.text.isEmpty) {
                                  return "Cannot add a Note without a title";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller:
                                  controller.dialogDescriptionController,
                              maxLines: 5,
                              decoration: const InputDecoration(
                                labelText: "Description",
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, bottom: 20),
              child: Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () => controller.dialogSaveCallback(index),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color.fromARGB(255, 242, 146, 73), // Custom color
                    padding: const EdgeInsets.all(15),
                  ),
                  child: const Icon(Icons.check, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
