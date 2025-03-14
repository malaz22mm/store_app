import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class UpdateProductService{
  Future<ProductModel> updateProductService({
    required int id,
    required String title,
    required String desc,
    required String image,
    required String price,
    required String category
  }) async
  {
    print('product id: $id');
    Map<String,dynamic>data=await Api().put(url: 'https://fakestoreapi.com/products/$id', body:
    {
      'title':title,
      'price':price,
      'description':desc,
      'image':image,
      'category':category
    }
    );
    return ProductModel.fromJson(data);
  }
}