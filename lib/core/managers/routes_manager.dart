

import 'package:flutter/material.dart';

import '../../features/task/presentation/pages/first_page.dart';
import '../../features/task/presentation/pages/second_page.dart';

class RoutesManager {


  static Map<String,Widget Function(BuildContext context)> allRoutes(){
    return {
      Routes.firstPage:(c)=>const FirstPage(),
      Routes.secondPage:(c)=>const SecondPage(),

    };
  }
}


class Routes{
  static const String firstPage = '/';
  static const String secondPage = '/second_page';
}