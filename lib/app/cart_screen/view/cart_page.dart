import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:shop_app/app/cart_screen/view/favorite_page.dart';

import '../controller/cart_controller.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<CartController>(
              builder: (controller) => ListView.separated(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 100,
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: 120,
                            child: Image.network(
                              controller.gridMap[index].image,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 200,
                                child: Text(
                                  controller.gridMap.elementAt(index).title,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "${controller.gridMap.elementAt(index).price}",
                                style: const TextStyle(
                                  color: Colors.greenAccent,
                                ),
                              ),
                              const Expanded(child: SizedBox(height: 10)),
                              GetBuilder<CartController>(
                                init: CartController(),
                                builder: (controller1) => Container(
                                  width: 120,
                                  height: 40,
                                  color: Colors.grey.shade200,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      IconButton(
                                          splashRadius: 25,
                                          onPressed: () {
                                            controller.changeCount(
                                                index, Opretion.incremnt);
                                          },
                                          icon: const Icon(Icons.add)),
                                      Text(
                                        "${controller.gridMap[index].count}",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontSize: 15, color: Colors.black),
                                      ),
                                      IconButton(
                                          splashRadius: 20,
                                          onPressed: () {
                                            controller.changeCount(
                                                index, Opretion.decrement);
                                          },
                                          icon: const Icon(Icons.remove)),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: controller.gridMap.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Column(
                    children: const [
                      SizedBox(height: 7.5),
                      Divider(indent: 20, endIndent: 20),
                      SizedBox(height: 7.5),
                    ],
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: GetBuilder<CartController>(
              init: CartController(),
              builder: (controller) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "TOTAL",
                        style: TextStyle(fontSize: 22, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "${controller.totalprice.toStringAsFixed(2)}",
                        style: const TextStyle(
                            fontSize: 18, color: Colors.greenAccent),
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 120,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.greenAccent),
                        child: const Text('CHECKOUT')),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
