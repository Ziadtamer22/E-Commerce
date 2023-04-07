import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/app/category_products/controller/products_controller.dart';
import 'package:shop_app/app/single_product/view/single_product.dart';
import 'package:shop_app/global/custom_methods.dart';

class CategoryProducts extends StatelessWidget {
  CategoryProducts({super.key, required this.category});
  final String category;
  final ProductsController _controller = Get.put(ProductsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          category.toUpperCase(),
          style: GoogleFonts.sourceSansPro().copyWith(
            fontSize: 25,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        toolbarHeight: 80,
        leading: IconButton(
          icon: SvgPicture.asset(
            "assets/svgs/left.svg",
            width: 30,
            height: 30,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: GetBuilder(
        builder: (controller) => GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 30, mainAxisExtent: 290),
            // itemCount: _controller.categoryCounter(category),

            itemCount: _controller.getcategoryProducts(category).length,
            shrinkWrap: true,
            itemBuilder: ((context, index) {
              final list = [];

              return buildProduct(
                  imagePath: list[index].image,
                  productName: list[index]?.productName,
                  subName: list[index].brandName,
                  price: list[index].productPrice,
                  onTap: () {
                    Get.to(SingleProduct(item: list[index]));
                  });
            })),
      ),
    );
  }
}
