import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_getx/logic/controller/main_controller.dart';
import 'package:shop_app_getx/utils/theme.dart';

class MainScreen extends StatelessWidget {
  final controller = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Get.isDarkMode ? mainColor : darkGreyClr,
            centerTitle: true,
            title: Text(controller.titleScreens[controller.currentIndex.value]),
            actions: [
              IconButton(
                icon: Image.asset('assets/images/shop.png'),
                onPressed: () {
                  Get.isDarkMode
                      ? Get.changeThemeMode(ThemeMode.light)
                      : Get.changeThemeMode(ThemeMode.dark);
                },
              ),
            ],
          ),
          body: IndexedStack(
            index: controller.currentIndex.value,
            children: controller.screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
            currentIndex: controller.currentIndex.value,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Get.isDarkMode ? Colors.black : Colors.white,
                ),
                // label: 'Home',
                label: '',
                activeIcon: Icon(
                  Icons.home,
                  color: Get.isDarkMode ? mainColor : pinkClr,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.category,
                  color: Get.isDarkMode ? Colors.black : Colors.white,
                ),
                // label: 'Category',
                label: '',
                activeIcon: Icon(
                  Icons.category,
                  color: Get.isDarkMode ? mainColor : pinkClr,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  color: Get.isDarkMode ? Colors.black : Colors.white,
                ),
                // label: 'Favorite',
                label: '',
                activeIcon: Icon(
                  Icons.favorite,
                  color: Get.isDarkMode ? mainColor : pinkClr,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  color: Get.isDarkMode ? Colors.black : Colors.white,
                ),
                // label: 'Settings',
                label: '',
                activeIcon: Icon(
                  Icons.settings,
                  color: Get.isDarkMode ? mainColor : pinkClr,
                ),
              ),
            ],
            onTap: (index) {
              controller.currentIndex.value = index;
            },
          ),
        );
      }),
    );
  }
}
