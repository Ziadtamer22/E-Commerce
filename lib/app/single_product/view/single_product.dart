import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/app/cart_screen/controller/cart_controller.dart';
import 'package:shop_app/app/category_products/model/products_model.dart';
import 'package:shop_app/app/single_product/controller/single_product_controller.dart';
import 'package:shop_app/app/single_product/view/custom_methods.dart';
import 'package:shop_app/data/models/cart.dart';

class SingleProduct extends GetView<SingleProductController> {
  SingleProduct({super.key, required this.item});
  final Product item;
  final SingleProductController _controller =
      Get.put(SingleProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product Details",
          style: GoogleFonts.sourceSansPro().copyWith(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
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
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        toolbarHeight: 80,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 300,
              decoration: const BoxDecoration(color: Colors.transparent),
              child: Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Image.network(item.image!),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title!,
                    style: GoogleFonts.sourceSansPro().copyWith(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    item.description!,
                    style: GoogleFonts.sourceSansPro()
                        .copyWith(fontSize: 16, color: const Color(0xff929292)),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "EGP ${item.price}",
                        style: GoogleFonts.sourceSansPro().copyWith(
                            fontSize: 23,
                            color: const Color(0xff00C569),
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          buildColorContainer(color: const Color(0xff3F4444)),
                          const SizedBox(
                            width: 5,
                          ),
                          buildColorContainer(color: const Color(0xffCCC7BB)),
                          const SizedBox(
                            width: 5,
                          ),
                          buildColorContainer(color: const Color(0xffCFCFCF)),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Have a coupon code?  enter here:",
                    style: GoogleFonts.sourceSansPro().copyWith(
                        fontSize: 15,
                        color: const Color.fromARGB(255, 128, 128, 128),
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 45,
                    child: TextField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 207, 207, 207),
                                  width: 2)),
                          focusedBorder: OutlineInputBorder()),
                    ),
                  ),
                  const SizedBox(
                    height: 27.5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/svgs/minus.svg",
                              color: const Color(0xff00C569),
                              width: 28,
                              height: 28),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: GetBuilder<CartController>(builder: (_) {
                              final indexOrNot =
                                  controller.getSingelProductCount(item.id!);
                              return Text(
                                indexOrNot == null
                                    ? '1'
                                    : '${_.gridMap[indexOrNot].count}'
                                        .toString(),
                                style: const TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              );
                            }),
                          ),
                          SvgPicture.asset(
                            "assets/svgs/plus.svg",
                            color: const Color(0xff00C569),
                            width: 28,
                            height: 28,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _controller.addToCart(CartItem(
                            id: item.id!,
                            title: item.title!,
                            price: item.price!,
                            image: item.image!,
                            count: 1,
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff00C569),
                            fixedSize: const Size(180, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12))),
                        child: Text(
                          "Add To Cart",
                          style: GoogleFonts.sourceSansPro().copyWith(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
