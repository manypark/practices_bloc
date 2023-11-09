import 'package:practices/features/products/domain/entities/product_entitie.dart';

abstract class ProductDataSource {
  Future<List<Product>> getProducts( int skip );
  Future<List<Product>> getProductsByCategorie( String category );
}