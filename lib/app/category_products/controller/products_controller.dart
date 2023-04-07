import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/app/category_products/model/products_model.dart';
import 'package:http/http.dart' as http;

class ProductsController extends GetxController {
  List<Product>? data;

  @override
  void onInit() {
    super.onInit();
    fetchTodos();
  }

  fetchTodos() async {
    data = [];
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      Get.snackbar('Api', 'Successful');
      final ls = jsonDecode(response.body) as List;
      data = ls.map((e) => Product.fromJson(e)).toList();
      update();
      return;
    } else {
      Get.snackbar('Api', 'somthing error happen');
    }
  }

  List getcategoryProducts(String category) {
    return data!.where((e) => e.category == category).toList();
  }
}
