import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/app/sign_in/view/sign_in.dart';
import 'package:shop_app/app/sign_up/controller/sing_up_controller.dart';
import 'package:shop_app/global/custom_methods.dart';

class SingUp extends GetView<SignUpController> {
  const SingUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpController());
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
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Get.to(const SignInScreen());
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                        size: 35,
                      )),
                  const Spacer(
                    flex: 1,
                  ),
                  const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 30),
                  ),
                  const Spacer(
                    flex: 1,
                  )
                ],
              ),
              const SizedBox(height: 30),
              Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      textfield(
                        type: 'name',
                        svgAsset: 'icons/use.svg',
                        hintText: 'First name',
                        onSaved: (p0) {
                          controller.firstName = p0;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Your name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 18),
                      textfield(
                          type: 'name',
                          svgAsset: 'icons/use.svg',
                          hintText: 'Last Name',
                          onSaved: (p0) {
                            controller.sacondName = p0;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Your name';
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 18,
                      ),
                      textfield(
                          type: 'email',
                          svgAsset: 'icons/email-svgrepo-com.svg',
                          hintText: 'Email',
                          onSaved: (p0) {
                            controller.email = p0;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This Filed is required';
                            }

                            if (!value.isEmail) {
                              return 'Please enter valid email';
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 18,
                      ),
                      textfield(
                          type: 'phone',
                          svgAsset: 'icons/phone-call-svgrepo-com.svg',
                          hintText: 'Phone Number',
                          onSaved: (p0) {
                            controller.phone = p0;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Your phone number';
                            }
                            if (value.length < 11) {
                              return 'please Enter 11 number';
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 18,
                      ),
                      GetBuilder<SignUpController>(
                        builder: (controller) => textfield(
                          type: 'password',
                          svgAsset: 'icons/key-svgrepo-com.svg',
                          hintText: 'Password',
                          isVisable: controller.isvisable,
                          onSuffixClicked: controller.changePasswordVisability,
                          onSaved: (p0) {
                            controller.password = p0;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      textfield(
                          type: 'password',
                          svgAsset: 'icons/key-svgrepo-com.svg',
                          hintText: 'Confirm Password',
                          onSaved: (p0) {
                            controller.password = p0;
                          })
                    ],
                  )),
              Row(
                children: [
                  const Text('Accept the Terms and Conditions'),
                  GetBuilder<SignUpController>(
                    builder: (controller) => Checkbox(
                        value: controller.isCecked,
                        activeColor: Colors.black,
                        onChanged: (bool? newValue) {
                          controller.checngeIschecked();
                        }),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              ElevatedButton(
                onPressed: controller.submit,
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(15))),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account ? '),
                  TextButton(
                      onPressed: (() {
                        Get.to(const SignInScreen());
                      }),
                      child: const Text('Sign In')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
/* 
  textfield({
    required String type,
    required String svgAsset,
    required String hintText,
    required void Function(String?)? onSaved, required bool? obscuredText,
  }) {
    return TextFormField(
        obscureText: (type == 'password') ? true : false,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SvgPicture.asset(
              svgAsset,
              color: const Color(0xff8F8F8F),
              height: 24,
              width: 24,
              fit: BoxFit.contain,
              matchTextDirection: true,
            ),
          ),
          suffixIcon: (type == 'password')
              ? IconButton(
                  icon: const Icon(Icons.remove_red_eye),
                  onPressed: () {
                    controller.changePasswordVisability();
                  })
              : null,
          hintText: hintText,
          hintStyle: GoogleFonts.vazirmatn().copyWith(
            fontSize: 14,
            color: const Color(0xffC2C2C2),
          ),
        ),
        validator: (type == 'password')
            ? (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Your password';
                }

                if (value.length < 8) {
                  return 'Please Enter at least 8 chars';
                }

                return null;
              }
            : (type == 'email')
                ? (value) {
                    if (value == null || value.isEmpty) {
                      return 'This Filed is required';
                    }

                    if (!value.isEmail) {
                      return 'Please enter valid email';
                    }
                    return null;
                  }
                : (type == 'phone')
                    ? (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Your phone number';
                        }
                        if (value.length < 11) {
                          return 'please Enter 11 number';
                        }
                        return null;
                      }
                    : (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Your name';
                        }
                        return null;
                      },
        onSaved: onSaved);
  }
 */

}
