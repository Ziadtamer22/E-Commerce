import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../sign_in/view/sign_in.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  late GlobalKey<FormState> key;

  @override
  void initState() {
    super.initState();
    key = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    'Forgot Password',
                    style: TextStyle(fontSize: 30),
                  ),
                  const Spacer(
                    flex: 1,
                  )
                ],
              ),
              const SizedBox(height: 50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    'Enter the email address you used to create your account and we will email you a link to reset your password',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Form(
                  key: key,
                  child: TextFormField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset(
                            'icons/email-svgrepo-com.svg',
                            color: const Color(0xff8F8F8F),
                            height: 24,
                            width: 24,
                            fit: BoxFit.contain,
                            matchTextDirection: true,
                          ),
                        ),
                        hintText: 'Enter your email',
                        hintStyle: GoogleFonts.vazirmatn().copyWith(
                          fontSize: 14,
                          color: const Color(0xffC2C2C2),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This Filed is required';
                        }

                        if (!value.isEmail) {
                          return 'Please enter valid email';
                        }
                        return null;
                      })),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(15))),
                onPressed: () {
                  _cheakEmail();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Spacer(),
                    Text(
                      'Send Email',
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
            ],
          ),
        ),
      ),
    );
  }

  _cheakEmail() {
    if (!key.currentState!.validate()) return;
    key.currentState?.save();
  }
}
