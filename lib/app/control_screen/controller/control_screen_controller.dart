import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop_app/app/cart_screen/view/cart_page.dart';
import 'package:shop_app/app/home_screen/view/home_screen.dart';
import 'package:shop_app/app/profile_screen/view/profile_screen.dart';

class ControlScreenController extends GetxController {
  Widget currentState = const HomeScreen();
  int navigatorValue = 0;
  void changeSelectedValue(int selectedValue) {
    switch (selectedValue) {
      case 0:
        currentState = const HomeScreen();
        break;
      case 1:
        currentState = const CartPage();
        break;
      case 2:
        currentState = const ProfileScreen();
    }
    navigatorValue = selectedValue;
    update();
  }
}
