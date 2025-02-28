class ProductModel {
  final dynamic id;
  final String title;
  final String description;
  final String image;
  final double price;
  final String category;
  final RatingModel rating;
  ProductModel(
      {required this.id,
        required this.category,
      required this.description,
      required this.image,
      required this.price,
      required this.title,
      required this.rating, });
  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
        category:jsonData['category'],
        id: jsonData['id'],
        title: jsonData['title'],
        description: jsonData['description'],
        image: jsonData['image'],
        price: jsonData['price'].toDouble(),
        rating: RatingModel.fromJson(jsonData['rating']));
  }
}
class RatingModel {
  final double rate;
  final int count;
  RatingModel({required this.count,required this.rate});
  factory RatingModel.fromJson(jsonData)
  {
    return RatingModel(count: jsonData['count'], rate: jsonData['rate'].toDouble() );
  }
}
