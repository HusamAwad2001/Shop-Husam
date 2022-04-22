import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:shop_app_getx/utils/theme.dart';
import 'package:shop_app_getx/view/widgets/app_text.dart';
import 'package:shop_app_getx/view/widgets/home/card_item.dart';
import 'package:shop_app_getx/view/widgets/home/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                color: Get.isDarkMode ? mainColor : darkGreyClr,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: 'Find Your',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 5),
                    AppText(
                      text: 'INSPIRATION',
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 20),
                    SearchBar(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: AppText(
                  text: 'Categories',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  textColor: Get.isDarkMode ? Colors.black : Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 30),
            CardItem(),
          ],
        ),
      ),
    );
  }
}
