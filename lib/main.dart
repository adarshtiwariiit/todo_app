import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/screens/todos/todos_screen.dart';
import 'package:todo_app/utils/constants/colors.dart';

import 'api_calls/services/common_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  initializeServices();
  runApp(const MyApp());
}

void initializeServices() {
  Get.put(CommonService(), permanent: true);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
              backgroundColor: AppColors.primaryBlue,
              foregroundColor: Colors.white,
              titleTextStyle:
                  TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.accentOrange),
          useMaterial3: true,
        ),
        home: TodosScreen());
  }
}
