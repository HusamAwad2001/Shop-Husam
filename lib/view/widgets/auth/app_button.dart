import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_getx/utils/theme.dart';
import 'package:shop_app_getx/view/widgets/app_text.dart';

class AppButton extends StatelessWidget {
  String text;
  double fontSize;
  FontWeight fontWeight;
  Function() onPressed;

  AppButton({
    Key? key,
    required this.text,
    this.fontSize = 18,
    this.fontWeight = FontWeight.bold,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Get.isDarkMode ? mainColor : pinkClr,
        minimumSize: const Size(360, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: AppText(
        text: text,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
