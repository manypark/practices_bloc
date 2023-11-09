import 'package:practices/features/products/domain/domain.dart';

class ProductMapper {

  static Product productToEntity( Map<String, dynamic> json ) => Product(
    id                : json['id'],
    title             : json['title'],
    description       : json['description'],
    price             : json['price'],
    discountPercentage: double.parse( json['discountPercentage'].toString() ),
    rating            : double.parse( json['rating'].toString() ),
    stock             : json['stock'],
    brand             : json['brand'],
    category          : json['category'],
    thumbnail         : json['thumbnail'],
    images            : json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
  );
}