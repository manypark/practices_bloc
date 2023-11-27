import 'package:dio/dio.dart';

import 'package:practices/config/config.dart';
import 'package:practices/features/products/domain/domain.dart';
import 'package:practices/features/products/infrastructure/mappers/product_mapper.dart';

class ProductDatasource extends ProductDataSource {

  final DioClient _clientDio;

  ProductDatasource({
    DioClient? clientDio,
  }): _clientDio = clientDio ?? DioClient(Dio());

  @override
  Future<List<Product>> getProducts( int skip ) async {
    
    try {

      final res = await _clientDio.get('?limit=12&skip=$skip');

      final products = jsonToProduct( res.data['products'] );

      return products;

    } catch (e) {
      throw Exception(e.toString());
    }

  }

  @override
  Future<List<Product>> getProductsByCategorie(String category) async {

    try {

      final res = await _clientDio.get('/category/$category');

      final products = jsonToProduct( res.data['products'] );

      return products;
      
    } catch (e) {
      throw Exception(e.toString());
    }

  }

  @override
  Future<List<Product>> searchProducts( String product ) async {
    try {

      final res = await _clientDio.get('/search?q=$product');

      final products = jsonToProduct( res.data['products'] );

      return products;
      
    } catch (e) {
      throw Exception(e.toString());
    }

  }

  List<Product> jsonToProduct( List<dynamic> json ) {
    final productResponse = json.map( (p) => ProductMapper.productToEntity(p)).toList();
    return productResponse;
  }
   
}
