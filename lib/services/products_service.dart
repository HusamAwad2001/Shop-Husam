import 'package:http/http.dart' as http;
import 'package:shop_app_getx/models/products_models.dart';
import 'package:shop_app_getx/utils/my_string.dart';

class ProductServices {
  static Future<List<ProductsModels>> getProduct() async {
    var response = await http.get(Uri.parse('$baseUrl/products'));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productsModelsFromJson(jsonData);
    } else {
      print('Failed to product load');
      return [];
    }
  }
}
