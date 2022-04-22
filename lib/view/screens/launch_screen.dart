import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_getx/routes/routes.dart';
import 'package:shop_app_getx/utils/theme.dart';
import 'package:shop_app_getx/view/widgets/app_text.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                'assets/images/background.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black.withOpacity(0.2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 100),
                  Container(
                    height: 60,
                    width: 190,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: AppText(
                        text: 'Welcome',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 60,
                    width: 230,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          text: 'Husam',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          textColor: mainColor,
                        ),
                        const SizedBox(width: 7),
                        AppText(
                          text: 'Shop',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 250),
                  ElevatedButton(
                    onPressed: () => Get.offNamed(Routes.loginScreen),
                    child: AppText(
                      text: 'Get Start',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 12),
                        primary: mainColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        text: 'Don\'t have an account?',
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                      TextButton(
                        onPressed: () => Get.offNamed(Routes.signUpScreen),
                        child: AppText(
                          text: 'Sign Up',
                          // textColor: mainColor,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          textDecoration: TextDecoration.underline,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
