import 'package:practices/features/products/domain/domain.dart';
import 'package:practices/features/products/infrastructure/infrastructure.dart';

class ProductRespotoryImpl extends ProductRepository {

  final ProductDataSource datasource;

  ProductRespotoryImpl({
    ProductDatasource? datasource,
  }): datasource = datasource ?? ProductDatasource();

  @override
  Future<List<Product>> getProducts() {
    return datasource.getProducts();
  }

  @override
  Future<List<Product>> getProductsByCategorie(String category) {
    return datasource.getProductsByCategorie(category);
  }
  
}