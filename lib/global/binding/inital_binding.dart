import 'package:get/get.dart';
import 'package:shop_app/app/cart_screen/controller/cart_controller.dart';
import 'package:shop_app/app/category_products/controller/products_controller.dart';
import 'package:shop_app/app/control_screen/controller/control_screen_controller.dart';
import 'package:shop_app/app/home_screen/controller/home_screen_controller.dart';

class MainBinig extends Bindings {
  @override
  void dependencies() {
    Get.put(ControlScreenController());
    Get.put(CartController());
    Get.put(ProductsController());
    Get.put(HomeScreenController());
  }
}
