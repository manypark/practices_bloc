import 'package:dio/dio.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import 'package:practices/config/config.dart';
import 'package:practices/features/products/infrastructure/infrastructure.dart';

class MockDioClient extends Mock implements DioClient {}

void main() {

  group('ProductDataSource', () {

    final mockDioClient = MockDioClient();
    final dataSource    = ProductDatasource(clientDio: mockDioClient);

    test('getProducts should return a list of products', () async {

      when(mockDioClient.get('?limit=12&skip=2')).thenAnswer((_) async => Response( 
          data: { 
            'products': CategoriesProducts.mockListProducts
          }, 
          requestOptions: RequestOptions()
        )
      );

      final result = await dataSource.getProducts(2);

      expect(result, equals( CategoriesProducts.mockProductJsonToEntity ) );
    });

    test('getProductsByCategorie should return a list of products by category', () async {

      when(mockDioClient.get('/category/smartphones')).thenAnswer((_) async => Response(
         data: {
            'products': CategoriesProducts.mockListProductsByCategory
          }, 
          requestOptions: RequestOptions()
        ),
      );

      final result = await dataSource.getProductsByCategorie('smartphones');

      expect( result, CategoriesProducts.mockProductJsonToEntityByCategory );
    });

    test('searchProducts should return a list of products searched', () async {

      when(mockDioClient.get('/search?q=smart')).thenAnswer((_) async => Response(
          data: {
            'products': CategoriesProducts.mockListProductsSearch
          }, 
          requestOptions: RequestOptions()
        )
      );

      final result = await dataSource.searchProducts('smart');

      expect( result, CategoriesProducts.mockProductJsonToEntitySearch );
    });

  });
}
