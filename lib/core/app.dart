

import 'package:flutter/material.dart';
import 'package:nour_task/core/managers/app_constant_manager.dart';
import 'package:nour_task/core/managers/routes_manager.dart';
import 'package:nour_task/core/managers/theme_manager.dart';
import 'package:nour_task/features/task/presentation/pages/first_page.dart';
import 'package:nour_task/features/task/presentation/pages/second_page.dart';

class MyApp extends StatelessWidget {

  const MyApp._internal();

  static MyApp instance = const MyApp._internal();


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeManager.theme(),
      debugShowCheckedModeBanner: false,
      title: AppConstantManager.appName,
      routes: RoutesManager.allRoutes(),
    );
  }
}
