// class ProductsModels {
//   late int id;
//   late String title;
//   late double price;
//   late String description;
//   late String category;
//   late String image;
//   late Rating rating;
//
//   ProductsModels.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     price = json['price'];
//     description = json['description'];
//     category = json['category'];
//     image = json['image'];
//     rating = (json['rating'] != null ? Rating.fromJson(json['rating']) : null)!;
//   }
// }
//
// class Rating {
//   double? rate;
//   int? count;
//
//   Rating({this.rate, this.count});
//
//   Rating.fromJson(Map<String, dynamic> json) {
//     rate = json['rate'];
//     count = json['count'];
//   }
// }

// To parse this JSON data, do
//
//     final productsModels = productsModelsFromJson(jsonString);

// import 'dart:convert';
//
// List<ProductsModels> productsModelsFromJson(String str) =>
//     List<ProductsModels>.from(
//         json.decode(str).map((x) => ProductsModels.fromJson(x)));
//
// class ProductsModels {
//   ProductsModels({
//     required this.id,
//     required this.title,
//     required this.price,
//     required this.description,
//     required this.category,
//     required this.image,
//     required this.rating,
//   });
//
//   int id;
//   String title;
//   double price;
//   String description;
//   Category category;
//   String image;
//   Rating rating;
//
//   factory ProductsModels.fromJson(Map<String, dynamic> json) => ProductsModels(
//         id: json["id"],
//         title: json["title"],
//         price: json["price"].toDouble(),
//         description: json["description"],
//         category: categoryValues.map[json['category']!]!,
//         image: json["image"],
//         rating: Rating.fromJson(json["rating"]),
//       );
// }
//
// enum Category { MEN_S_CLOTHING, JEWELERY, ELECTRONICS, WOMEN_S_CLOTHING }
//
// final categoryValues = EnumValues({
//   "electronics": Category.ELECTRONICS,
//   "jewelery": Category.JEWELERY,
//   "men's clothing": Category.MEN_S_CLOTHING,
//   "women's clothing": Category.WOMEN_S_CLOTHING
// });
//
// class Rating {
//   Rating({
//     required this.rate,
//     required this.count,
//   });
//
//   double rate;
//   int count;
//
//   factory Rating.fromJson(Map<String, dynamic> json) => Rating(
//         rate: json["rate"].toDouble(),
//         count: json["count"],
//       );
// }
//
// class EnumValues<T> {
//   late Map<String, T> map;
//   late Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }
// To parse this JSON data, do
//
//     final productsModels = productsModelsFromJson(jsonString);

// To parse this JSON data, do
//
//     final productsModels = productsModelsFromJson(jsonString);

import 'dart:convert';

List<ProductsModels> productsModelsFromJson(String str) =>
    List<ProductsModels>.from(
        json.decode(str).map((x) => ProductsModels.fromJson(x)));

class ProductsModels {
  ProductsModels({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  int id;
  String title;
  double price;
  String description;
  Category? category;
  String image;
  Rating rating;

  factory ProductsModels.fromJson(Map<String, dynamic> json) => ProductsModels(
        id: json["id"],
        title: json["title"],
        price: json["price"].toDouble(),
        description: json["description"],
        category: categoryValues.map![json["category"]],
        image: json["image"],
        rating: Rating.fromJson(json["rating"]),
      );
}

enum Category { MEN_S_CLOTHING, JEWELERY, ELECTRONICS, WOMEN_S_CLOTHING }

final categoryValues = EnumValues({
  "electronics": Category.ELECTRONICS,
  "jewelery": Category.JEWELERY,
  "men's clothing": Category.MEN_S_CLOTHING,
  "women's clothing": Category.WOMEN_S_CLOTHING
});

class Rating {
  Rating({
    required this.rate,
    required this.count,
  });

  double rate;
  int count;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"].toDouble(),
        count: json["count"],
      );
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
