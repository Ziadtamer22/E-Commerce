import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shop_app/app/category_products/view/category_products.dart';

import '../model/home_screen_model.dart';

class HomeScreenController extends GetxController {
  List<CategoriesIcons> categoriesIcons = [
    CategoriesIcons(
        title: "Men",
        picture: SvgPicture.asset(
          "assets/svgs/men.svg",
          width: 55,
          height: 50,
        ),
        onTap: () {
          Get.to(CategoryProducts(
            category: "men",
          ));
        }),
    CategoriesIcons(
        title: "Women",
        picture: SvgPicture.asset(
          "assets/svgs/heels.svg",
          width: 50,
          height: 45,
        ),
        onTap: () {
          Get.to(CategoryProducts(
            category: "women",
          ));
        }),
    CategoriesIcons(
        title: "Devices",
        picture: SvgPicture.asset(
          "assets/svgs/lamp.svg",
          width: 50,
          height: 45,
        ),
        onTap: () {}),
    CategoriesIcons(
        title: "Gadgets",
        picture: SvgPicture.asset(
          "assets/svgs/headphones.svg",
          width: 50,
          height: 45,
        ),
        onTap: () {}),
    CategoriesIcons(
        title: "Gaming",
        picture: SvgPicture.asset(
          "assets/svgs/gaming.svg",
          width: 50,
          height: 45,
        ),
        onTap: () {}),
  ];
}
