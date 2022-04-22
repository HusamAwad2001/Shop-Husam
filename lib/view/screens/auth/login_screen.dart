import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_getx/logic/controller/auth_controller.dart';
import 'package:shop_app_getx/routes/routes.dart';
import 'package:shop_app_getx/utils/my_string.dart';
import 'package:shop_app_getx/utils/theme.dart';
import 'package:shop_app_getx/view/widgets/app_text.dart';
import 'package:shop_app_getx/view/widgets/auth/app_bottom_container.dart';
import 'package:shop_app_getx/view/widgets/auth/app_button.dart';
import 'package:shop_app_getx/view/widgets/auth/app_text_field.dart';

class LoginScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            AppText(
                              text: 'LOG',
                              textColor: Get.isDarkMode ? mainColor : pinkClr,
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                            ),
                            const SizedBox(width: 3),
                            AppText(
                              text: 'IN',
                              textColor:
                                  Get.isDarkMode ? Colors.black : Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                            )
                          ],
                        ),
                        const SizedBox(height: 60),
                        //email
                        AppTextField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (!RegExp(validationEmail).hasMatch(value)) {
                              return 'Invalid email';
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: Get.isDarkMode
                              ? Image.asset('assets/images/email.png')
                              : const Icon(
                                  Icons.email,
                                  color: pinkClr,
                                  size: 30,
                                ),
                          hintText: 'Email',
                        ),
                        const SizedBox(height: 20),
                        //password
                        GetBuilder<AuthController>(
                          builder: (_) {
                            return AppTextField(
                              controller: _passwordController,
                              obscureText: controller.isVisibility,
                              validator: (value) {
                                if (value.toString().length < 6) {
                                  return 'Password should be longer or equal to 6 characters';
                                } else {
                                  return null;
                                }
                              },
                              suffixIcon: IconButton(
                                  onPressed: () => controller.visibility(),
                                  icon: controller.isVisibility
                                      ? const Icon(
                                          Icons.visibility_off,
                                          color: Colors.black,
                                        )
                                      : const Icon(
                                          Icons.visibility,
                                          color: Colors.black,
                                        )),
                              prefixIcon: Get.isDarkMode
                                  ? Image.asset('assets/images/lock.png')
                                  : const Icon(
                                      Icons.lock,
                                      color: pinkClr,
                                      size: 30,
                                    ),
                              hintText: 'Password',
                            );
                          },
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () =>
                                Get.toNamed(Routes.forgotPasswordScreen),
                            child: AppText(
                              text: 'Forgot Password?',
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              textColor:
                                  Get.isDarkMode ? Colors.black : Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                        GetBuilder<AuthController>(builder: (_) {
                          return AppButton(
                            text: 'LOG IN',
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                controller.signIn(
                                  context,
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text,
                                );
                              }
                            },
                          );
                        }),
                        const SizedBox(height: 20),
                        AppText(
                          text: 'OR',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          textColor:
                              Get.isDarkMode ? Colors.black : Colors.white,
                        ),
                        const SizedBox(height: 20),
                        GetBuilder<AuthController>(
                          builder: (_) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  child:
                                      Image.asset('assets/images/facebook.png'),
                                  onTap: () {
                                    // controller.faceBookSignUp();
                                  },
                                ),
                                const SizedBox(width: 10),
                                InkWell(
                                  child:
                                      Image.asset('assets/images/google.png'),
                                  onTap: () {
                                    controller.googleSignUp();
                                  },
                                ),
                              ],
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
              AppBottomContainer(
                text: 'Don\'t have an account?',
                textButton: 'Sign up',
                onPressed: () {
                  Get.offNamed(Routes.signUpScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
