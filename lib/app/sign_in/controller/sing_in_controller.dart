import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_app/app/control_screen/view/control_screen.dart';
import 'package:shop_app/app/sign_in/view/loading.dart';
import 'package:shop_app/global/binding/inital_binding.dart';

class SignIController extends GetxController {
  late GlobalKey<FormState> signInFormKEy;
  String? email;
  String? password;
  String? name;
  bool isVisable = false;
  bool isCecked = false;
  @override
  void onInit() {
    super.onInit();
    signInFormKEy = GlobalKey<FormState>();

    check();
  }

  final auth = FirebaseAuth.instance;

  changePassword() {
    isVisable = !isVisable;
    update();
  }

  checngeIschecked() {
    isCecked = !isCecked;
    update();
  }

  submit() async {
    if (!signInFormKEy.currentState!.validate()) return;
    signInFormKEy.currentState!.save();

    try {
      final user = await auth.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );

      Get.snackbar('Welcome', '${user.user?.email}');
      if (isCecked) {
        GetStorage().write('email', email);

        GetStorage().write('uid', user.user?.uid);
      }
      Get.to(ControlScreen());
    } on FirebaseAuthException catch (err) {
      Get.snackbar('Error', '${err.message}');
    } catch (err) {
      log(err.toString());
    }
  }

  check() async {
    await auth.currentUser?.reload();
    if (GetStorage().read('uid') == null) {
      log('no auth');
    } else {
      log(auth.currentUser!.email!);
      Get.offAll(() => const ControlScreen(), binding: MainBinig());
    }
  }

  logout() async {
    await auth.signOut();
  }
}
