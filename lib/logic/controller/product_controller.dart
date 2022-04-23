import 'package:get/get.dart';
import 'package:shop_app_getx/models/products_models.dart';
import 'package:shop_app_getx/services/products_service.dart';

class ProductController extends GetxController {
  var productList = <ProductsModels>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getProducts();
  }

  void getProducts() async {
    var products = await ProductServices.getProduct();
    try {
      isLoading(true);
      // isLoading.value = true;
      if (products.isNotEmpty) {
        productList.addAll(products);
      }
    } finally {
      isLoading(false);
      // isLoading.value = false;
    }
  }
}
