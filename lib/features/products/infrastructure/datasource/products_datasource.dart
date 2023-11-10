import 'package:dio/dio.dart';
import 'package:practices/features/products/domain/domain.dart';
import 'package:practices/features/products/infrastructure/mappers/product_mapper.dart';

class ProductDatasource extends ProductDataSource {

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://dummyjson.com/products'
    )
  );

  @override
  Future<List<Product>> getProducts( int skip ) async {
    
    try {

      final res = await dio.get('?limit=12&skip=$skip');

      final resProducts = res.data['products'];

      final products = _jsonToProduct( resProducts );

      return products;

    } catch (e) {
      throw Exception(e.toString());
    }

  }

  @override
  Future<List<Product>> getProductsByCategorie(String category) async {

    try {

      final res = await dio.get('/category/$category');

      final products = _jsonToProduct( res.data['products'] );

      return products;
      
    } catch (e) {
      throw Exception(e.toString());
    }

  }

  @override
  Future<List<Product>> searchProducts( String product ) async {
    try {

      final res = await dio.get('/search?q=$product');

      final products = _jsonToProduct( res.data['products'] );

      return products;
      
    } catch (e) {
      throw Exception(e.toString());
    }

  }

  List<Product> _jsonToProduct( List<dynamic> json ) {
    final productResponse = json.map( (p) => ProductMapper.productToEntity(p)).toList();
    return productResponse;
  }
   
}
