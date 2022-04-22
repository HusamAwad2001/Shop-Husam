import 'package:get/get_navigation/get_navigation.dart';
import 'package:shop_app_getx/logic/binding/auth_binding.dart';
import 'package:shop_app_getx/logic/binding/main_binding.dart';
import 'package:shop_app_getx/view/screens/auth/forgot_password.dart';
import 'package:shop_app_getx/view/screens/auth/login_screen.dart';
import 'package:shop_app_getx/view/screens/auth/signup_screen.dart';
import 'package:shop_app_getx/view/screens/launch_screen.dart';
import 'package:shop_app_getx/view/screens/main_screen.dart';

/// [Get.to] => Like the [MaterialPageRoute]
/// [Get.toNamed] => Like the [pushNamed]
/// [Get.offNamed] => Like the [pushReplacementNamed]

class AppRoutes {
  //initialRoute
  static const launchScreen = Routes.launchScreen;
  static const mainScreen = Routes.mainScreen;

  //getScreens
  static final routes = [
    GetPage(name: Routes.launchScreen, page: () => const LaunchScreen()),
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () => SignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.mainScreen,
      page: () => MainScreen(),
      bindings: [
        AuthBinding(),
        MainBinding(),
      ],
    ),
  ];
}

class Routes {
  static const launchScreen = '/launch_screen';
  static const loginScreen = '/login_screen';
  static const signUpScreen = '/signup_screen';
  static const forgotPasswordScreen = '/forgot_screen';
  static const mainScreen = '/main_screen';
}
