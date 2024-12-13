// ignore_for_file: depend_on_referenced_packages
import 'dart:async';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../utils/constants/app_constants.dart';

class CommonService extends GetxController {
  Future<Box> get _getBox async {
    try {
      await Hive.openBox<dynamic>(AppConstants.appBox);
      return Hive.box<dynamic>(AppConstants.appBox);
    } catch (e) {
      // Handle error opening the box
      log('Error opening Hive box: $e');
      rethrow; // Re-throw exception to notify callers
    }
  }

  Future<void> saveValue(dynamic key, dynamic value) async {
    await Hive.openBox<dynamic>(AppConstants.appBox);
    final box = await _getBox;
    await box.put(key, value);
  }

  Future<dynamic> getValue(dynamic key) async {
    await Hive.openBox<dynamic>(AppConstants.appBox);
    final box = await _getBox;
    return box.get(key);
  }

  Future<void> clearData(dynamic key) async {
    await Hive.openBox<dynamic>(AppConstants.appBox);
    final box = await _getBox;
    box.delete(key);
  }

  Future<void> deleteBox() async {
    final box = await _getBox;
    await box.clear();
    // Hive.box<void>('visit_app').clear();
  }

  @override
  void onInit() async {
    await Hive.openBox<dynamic>(AppConstants.appBox);

    super.onInit();
  }
}
