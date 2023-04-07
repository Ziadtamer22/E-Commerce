import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/app/category_products/model/products_model.dart';

import '../../../global/custom_methods.dart';
import '../../category_products/controller/products_controller.dart';
import '../../single_product/view/single_product.dart';
import '../controller/home_screen_controller.dart';
import 'custom_methods.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SizedBox(
                height: 50,
                child: TextField(
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: 'Search something...',
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                      height: 1.3,
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SvgPicture.asset("assets/svgs/search.svg",
                          width: 23, height: 23),
                    ),
                    prefixIconConstraints:
                        const BoxConstraints(minWidth: 15, minHeight: 15),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(75),
                        borderSide:
                            const BorderSide(color: Colors.transparent)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(75),
                        borderSide:
                            const BorderSide(color: Colors.transparent)),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 239, 238, 238),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "Categories",
                style: GoogleFonts.sourceSansPro()
                    .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 105,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: ListView.separated(
                    itemCount: controller.categoriesIcons.length,
                    physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 18);
                    },
                    itemBuilder: ((context, index) {
                      return buildCategoriesIcons(
                          title: controller.categoriesIcons[index].title,
                          picture: controller.categoriesIcons[index].picture,
                          onTap: controller.categoriesIcons[index].onTap);
                    })),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "Best Selling",
                    style: GoogleFonts.sourceSansPro()
                        .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "See all",
                        style: GoogleFonts.sourceSansPro()
                            .copyWith(fontSize: 17, color: Colors.black),
                      )),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     buildProduct(
            //         imagePath: "assets/images/home_image1.png",
            //         productName: "BeoPlay Speaker",
            //         subName: "Bang and Olufsen",
            //         price: 755,
            //         onTap: () {}),
            //     buildProduct(
            //         imagePath: "assets/images/home_image2.png",
            //         productName: "Tag Heuer",
            //         subName: "Bang and Olufsen",
            //         price: 450,
            //         onTap: () {})
            //   ],
            // )
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SizedBox(
                height: 290,
                child: GetBuilder<ProductsController>(
                  builder: (controller1) => controller1.data == null
                      ? CircularProgressIndicator()
                      : ListView.separated(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics(),
                          ),
                          itemCount: controller1.data!.length,
                          shrinkWrap: true,
                          separatorBuilder: (context, index) => const SizedBox(
                                width: 20,
                              ),
                          itemBuilder: ((context, index) {
                            return buildProduct(
                                imagePath: controller1.data![index].image!,
                                productName: controller1.data![index].title!,
                                subName: controller1.data![index].category!,
                                price: controller1.data![index].price!,
                                onTap: () {
                                  Get.to(SingleProduct(
                                      item: controller1.data![index]));
                                });
                          })),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
