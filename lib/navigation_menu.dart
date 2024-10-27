import 'package:cikitsakai/feature/personalization/screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'ChatScreen.dart';
import 'DashboardScreen.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigatorController());

    return Scaffold(

        bottomNavigationBar: Obx(

          () => NavigationBar(


            height: 80,
            elevation: 0,
            backgroundColor: const Color(0xFFF6F6F6),
            indicatorColor: Colors.tealAccent,
            shadowColor: Colors.green,

            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            surfaceTintColor: Colors.white,
            destinations: const [

              NavigationDestination(icon: Icon(Iconsax.message), label: 'Chat',),
              NavigationDestination(icon: Icon(Iconsax.home_1), label: 'Home'),
              NavigationDestination(
                  icon: Icon(Iconsax.user), label: 'Setting'),
            ],
          ),
        ),
         body: Obx(() => controller.screen[controller.selectedIndex.value]),
        );
  }
}

class NavigatorController extends GetxController {
  final Rx<int> selectedIndex = 1.obs;

  //List Of Screen Widget
  final screen = [
    const ChatScreen(),
    const DashboardScreen(),
    const ProfileScreen()
  ];
}
