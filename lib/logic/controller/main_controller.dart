import 'package:get/get.dart';
import 'package:shop_app_getx/view/screens/bn_screen/category_screen.dart';
import 'package:shop_app_getx/view/screens/bn_screen/favorites_screen.dart';
import 'package:shop_app_getx/view/screens/bn_screen/home_screen.dart';
import 'package:shop_app_getx/view/screens/bn_screen/settings_screen.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;
  final screens = [
    HomeScreen(),
    CategoryScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ].obs;
  final titleScreens = [
    'Husam Shop',
    'Category Screen',
    'Favorites Screen',
    'Settings Screen',
  ].obs;

  void changeTheme() {}
}
