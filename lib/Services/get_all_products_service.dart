
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class GetAllProductsService {
  Future<List<ProductModel>> getAllProducts() async {
    try {
      List<dynamic> data = await Api().get(url: 'https://fakestoreapi.com/products');
      print('API Response: $data'); // Debug: Print the raw API response
      List<ProductModel> productsList = [];
      for (int i = 0; i < data.length; i++) {
        productsList.add(ProductModel.fromJson(data[i])); // Convert JSON to ProductModel
      }
      print('Parsed Products: $productsList'); // Debug: Print the parsed products
      return productsList;
    } catch (e) {
      print('Error fetching products: $e'); // Debug: Print any errors
      throw Exception('Failed to load products: $e');
    }
  }
}