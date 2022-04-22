import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_getx/utils/theme.dart';
import 'package:shop_app_getx/view/widgets/app_text.dart';

class AppBottomContainer extends StatelessWidget {
  String text;
  String textButton;
  Function() onPressed;

  AppBottomContainer({
    required this.text,
    required this.textButton,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 108,
      decoration: BoxDecoration(
        color: Get.isDarkMode ? mainColor : pinkClr,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText(
            text: text,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
          TextButton(
            onPressed: onPressed,
            child: AppText(
              text: textButton,
              fontSize: 17,
              fontWeight: FontWeight.bold,
              textDecoration: TextDecoration.underline,
            ),
          )
        ],
      ),
    );
  }
}
