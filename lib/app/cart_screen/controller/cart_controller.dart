import 'package:get/get.dart';
import 'package:shop_app/data/models/cart.dart';

enum Opretion { incremnt, decrement }

class CartController extends GetxController {
  double totalprice = 0;

  @override
  void onInit() {
    super.onInit();
    updateTotalPrice();
  }

  List<CartItem> gridMap = [];
  void changeCount(int index, Opretion newCount) {
    switch (newCount) {
      case Opretion.incremnt:
        gridMap[index].count++;
        break;
      case Opretion.decrement:
        if (gridMap[index].count == 1) {
          gridMap.removeAt(index);
        } else {
          gridMap[index].count--;
        }

        break;
    }

    updateTotalPrice();
  }

  updateTotalPrice() {
    totalprice = 0.0;
    for (var item in gridMap) {
      final singelPrice = item.count * item.price;
      totalprice += singelPrice;
    }
    update();
  }

/*   void addPrice(int id) {
    log("$priceAdd \n");
    log("\t $totalprice");

    priceAdd = (gridMap.firstWhere((element) => element["id"] == id)["price"]) *
        quantity;
    log("$priceAdd \n");
    log("\t $totalprice");
    totalprice += priceAdd;

    log("$priceAdd \n");
    log("\t $totalprice");
    update();
  } */

/*   void removePrice(int id) {
    price = gridMap.firstWhere((element) => element["id"] == id)["price"];
    totalprice = totalprice - price;
    update();
  } */
}
