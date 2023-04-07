import 'package:flutter/material.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:shop_app/app/forget_password/view/forgot_password.dart';
import 'package:shop_app/app/sign_in/controller/sing_in_controller.dart';
import 'package:shop_app/global/custom_methods.dart';

// import 'package:google_sign_in/google_sign_in.dart';

import '../../sign_up/view/sing_up.dart';

class SignInScreen extends GetView<SignIController> {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignIController());

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(26, 238, 236, 236),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  height: 180,
                  width: 180,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.grey),
                  child: Image.asset('icons/shop_app.png')),
              const SizedBox(height: 30),
              Form(
                  key: controller.signInFormKEy,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      textfield(
                        type: 'email',
                        svgAsset: 'icons/use.svg',
                        hintText: 'Enter your email',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This Filed is required';
                          }

                          if (!value.isEmail) {
                            return 'Please enter valid email';
                          }
                          return null;
                        },
                        onSaved: (p0) => controller.email = p0,
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      GetBuilder<SignIController>(
                        builder: (controller) => textfield(
                          type: 'password',
                          svgAsset: 'icons/key-svgrepo-com.svg',
                          hintText: 'Enter your password',
                          isVisable: controller.isVisable,
                          onSuffixClicked: controller.changePassword,
                          onSaved: (p0) => controller.password = p0,
                        ),
                      ),
                      Row(
                        children: [
                          const Text('Remember me'),
                          GetBuilder<SignIController>(
                            builder: (controller) => Checkbox(
                                value: controller.isCecked,
                                activeColor: Colors.black,
                                onChanged: (bool? newValue) {
                                  controller.checngeIschecked();
                                }),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: (() {
                              Get.to(const ForgotScreen());
                            }),
                            child: const Text(
                              'Forgot Password ?',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
              const SizedBox(height: 18),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(15))),
                onPressed: () {
                  controller.submit();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Spacer(),
                    Text(
                      'Log In',
                      style: TextStyle(fontSize: 18),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_circle_right,
                      size: 35,
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Creat new accont ? ',
                    style: TextStyle(fontSize: 18),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.to(const SingUp());
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 18),
                      )),
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              ElevatedButton(
                onPressed: (() {}),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(15))),
                child: const Text('Sign In With Google'),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: (() {}),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xff3b5998)),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(15))),
                child: const Text('Sign In With Facebook'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
