import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:shop_app_getx/logic/controller/product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
  }
}
