import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_app/app/profile_screen/view/privasypolicy.dart';
import 'package:shop_app/app/profile_screen/view/setting_screen.dart';
import 'package:shop_app/app/sign_in/view/sign_in.dart';
import 'package:shop_app/app/sign_up/controller/sing_up_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpController controller = Get.put(SignUpController());
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.grey.shade200,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () => controller.seleteImage(ImageSource.camera),
                  child: GetBuilder<SignUpController>(
                    builder: (controller) => Container(
                      height: 100,
                      width: 100,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey),
                      child: controller.seletedImage != null
                          ? Image.file(
                              controller.seletedImage!,
                              fit: BoxFit.cover,
                            )
                          : const Icon(Icons.person),
                    ),
                  ),
                ),
                Text(
                  "${controller.firstName} ${controller.sacondName} ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Icon(Icons.edit),
              ],
            ),
            const SizedBox(height: 30),
            Card(
              elevation: 4,
              margin: const EdgeInsets.fromLTRB(25, 8, 25, 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.location_on),
                    title: const Text('Shipping Adress'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {},
                  ),
                  Container(
                    width: double.infinity,
                    height: 4,
                    color: Colors.grey.shade300,
                  ),
                  ListTile(
                    leading: const Icon(Icons.lock_clock),
                    title: const Text('Order History'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {},
                  ),
                  Container(
                    width: double.infinity,
                    height: 4,
                    color: Colors.grey.shade300,
                  ),
                  ListTile(
                    leading: const Icon(Icons.shopping_cart),
                    title: const Text('Cards'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {},
                  ),
                  Container(
                    width: double.infinity,
                    height: 4,
                    color: Colors.grey.shade300,
                  ),
                  ListTile(
                    leading: const Icon(Icons.privacy_tip),
                    title: const Text('Privacy Policy'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PrivacyPolicy()),
                      );
                    },
                  ),
                  Container(
                    width: double.infinity,
                    height: 4,
                    color: Colors.grey.shade300,
                  ),
                  ListTile(
                    leading: const Icon(Icons.info),
                    title: const Text('About Us'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AboutDialog()),
                      );
                    },
                  ),
                  Container(
                    width: double.infinity,
                    height: 4,
                    color: Colors.grey.shade300,
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Settings'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SettingScreen()),
                      );
                    },
                  ),
                  Container(
                    width: double.infinity,
                    height: 4,
                    color: Colors.grey.shade300,
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('Log Out'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Get.to(SignInScreen());
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
