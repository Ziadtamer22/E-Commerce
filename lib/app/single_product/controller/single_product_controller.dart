import 'dart:developer';

import 'package:get/get.dart';
import 'package:shop_app/app/cart_screen/controller/cart_controller.dart';
import 'package:shop_app/data/models/cart.dart';

class SingleProductController extends GetxController {
  addToCart(CartItem item) {
    log(Get.find<CartController>().gridMap.length.toString());
    Get.find<CartController>().gridMap.add(item);
    Get.find<CartController>().updateTotalPrice();

    log(Get.find<CartController>().gridMap.length.toString());
  }

  int? getSingelProductCount(int id) {
    final indexOfprod = Get.find<CartController>()
        .gridMap
        .indexWhere((element) => element.id == id);
    if (indexOfprod > 0) return indexOfprod;
    return null;
  }
}
