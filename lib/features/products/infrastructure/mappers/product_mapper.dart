import 'package:practices/features/products/domain/domain.dart';

class ProductMapper {

  static Product productToEntity( Map<String, dynamic> json ) => Product(
    id                : json['id'],
    title             : json['title'],
    description       : json['description'],
    price             : json['price'],
    discountPercentage: json['discountPercentage'],
    rating            : json['rating'],
    stock             : json['stock'],
    brand             : json['brand'],
    category          : json['category'],
    thumbnail         : json['thumbnail'],
    images            : json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
  );
}