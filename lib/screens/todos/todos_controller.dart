import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/api_calls/models/todo_%20model.dart';
import 'package:todo_app/api_calls/services/common_service.dart';
import 'package:todo_app/screens/todos/widget/description_dialog.dart';
import 'package:todo_app/utils/constants/app_constants.dart';

class TodosController extends GetxController {
  final CommonService commonService = Get.find<CommonService>();
  RxList<TodoModel> todoList = <TodoModel>[].obs;
  RxBool isLoading = true.obs;
  RxBool isAddingItem = false.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  final dialogTitleController = TextEditingController();
  final dialogDescriptionController = TextEditingController();
  final dialogFormKey = GlobalKey<FormState>();

  static TodosController get instance => Get.find<TodosController>();

  @override
  void onInit() {
    super.onInit();
    initPage();
  }

  Future<void> initPage() async {
    await getTodoList();
    isLoading.value = false;
  }

  Future<void> getTodoList() async {
    final List<dynamic> data =
        await commonService.getValue(AppConstants.todoList) ?? [];

    todoList.addAll(TodoListModel.fromJson(data).todos);
  }

  Future<void> toggleFloatingButton() async {
    FocusManager.instance.primaryFocus!.unfocus();
    if (isAddingItem.value && formkey.currentState!.validate()) {
      await Future.delayed(const Duration(milliseconds: 500));
      if (nameController.text.isEmpty) {
        isAddingItem.value = !isAddingItem.value;
        return;
      }
      final TodoModel todo = TodoModel(
        title: nameController.text,
        description: descriptionController.text,
        isCompleted: false,
      );
      todoList.add(todo);
      final data = TodoListModel(todos: todoList);
      await commonService.saveValue(AppConstants.todoList, data.toJson());

      nameController.clear();
      descriptionController.clear();
      isAddingItem.value = !isAddingItem.value;
      return;
    }
    if (!isAddingItem.value) {
      isAddingItem.value = !isAddingItem.value;
    }
  }

  Future<void> tileTapCallback(
    int index,
  ) async {
    dialogTitleController.text = todoList[index].title ?? "Title";
    dialogDescriptionController.text =
        todoList[index].description ?? "Description";
    await Get.dialog(DescriptionDialog(index: index));
  }

  Future<void> dialogSaveCallback(int index) async {
    if (dialogFormKey.currentState!.validate()) {
      final TodoModel todo = TodoModel(
        title: dialogTitleController.text,
        description: dialogDescriptionController.text,
        isCompleted: todoList[index].isCompleted,
      );
      todoList[index] = todo;
      final data = TodoListModel(todos: todoList);
      await commonService.saveValue(AppConstants.todoList, data.toJson());
      Get.back();
    }
  }

  Future<void> checkBoxCallback(bool value, int index) async {
    todoList[index].isCompleted = value;
    final data = TodoListModel(todos: todoList);
    await commonService.saveValue(AppConstants.todoList, data.toJson());
    todoList.refresh();
  }

  void delteTodoItem(int index) {
    todoList.removeAt(index);
    final data = TodoListModel(todos: todoList);
    commonService.saveValue(AppConstants.todoList, data.toJson());
  }
}
