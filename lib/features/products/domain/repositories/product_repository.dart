import 'package:practices/features/products/domain/entities/product_entitie.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
  Future<List<Product>> getProductsByCategorie( String category );
}