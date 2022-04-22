import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  String text;
  double fontSize;
  FontWeight fontWeight;
  Color textColor;
  TextDecoration textDecoration;

  AppText({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    this.textColor = Colors.white,
    this.textDecoration = TextDecoration.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: textDecoration,
      ),
    );
  }
}
