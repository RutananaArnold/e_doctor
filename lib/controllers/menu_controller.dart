import 'package:flutter/material.dart';
import 'package:get/get.dart';

final menuContlr = Get.put(MenuController());

class MenuController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void openCloseDrawer(BuildContext context) {
    scaffoldKey.currentState!.isDrawerOpen
        ? Navigator.pop(context)
        : scaffoldKey.currentState?.openDrawer();
  }
}
