import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:shop_app_getx/logic/controller/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}
