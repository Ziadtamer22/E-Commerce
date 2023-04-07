import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../controller/control_screen_controller.dart';

class ControlScreen extends StatelessWidget {
  const ControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControlScreenController>(
      builder: (controller) => Scaffold(
        body: controller.currentState,
        bottomNavigationBar: Container(
          height: 58,
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
                color: Color.fromARGB(255, 240, 240, 240),
                blurRadius: 6,
                spreadRadius: 1)
          ]),
          child: GetBuilder(
            init: ControlScreenController(),
            builder: ((controller) => BottomNavigationBar(
                  elevation: 0.0,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  selectedItemColor: const Color(0xff00C569),
                  items: [
                    BottomNavigationBarItem(
                        activeIcon: SvgPicture.asset(
                          "assets/svgs/home.svg",
                          width: 25,
                          height: 25,
                          color: const Color(0xff00C569),
                        ),
                        icon: SvgPicture.asset("assets/svgs/home.svg",
                            width: 25, height: 25),
                        label: ""),
                    BottomNavigationBarItem(
                        activeIcon: SvgPicture.asset(
                          "assets/svgs/cart.svg",
                          width: 25,
                          height: 25,
                          color: const Color(0xff00C569),
                        ),
                        icon: SvgPicture.asset("assets/svgs/cart.svg",
                            width: 28, height: 28),
                        label: ""),
                    BottomNavigationBarItem(
                        activeIcon: SvgPicture.asset(
                          "assets/svgs/profile.svg",
                          width: 25,
                          height: 25,
                          color: const Color(0xff00C569),
                        ),
                        icon: SvgPicture.asset("assets/svgs/profile.svg",
                            width: 28, height: 28),
                        label: "")
                  ],
                  currentIndex: controller.navigatorValue,
                  onTap: ((index) {
                    controller.changeSelectedValue(index);
                  }),
                )),
          ),
        ),
      ),
    );
  }
}
