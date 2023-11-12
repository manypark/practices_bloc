import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practices/features/products/domain/domain.dart';
import 'package:practices/features/products/infrastructure/infrastructure.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {

  final _productRepository = ProductRespotoryImpl();
  int _skipCurrent = 0;
  
  ProductsBloc() : super( const ProductsState() ) {
    on<ProductsLoaded>( _loadProductsHanlder );
    on<ProductSelected>( _selectedProductHandler );
    on<ProductSearch>( _searchProduct );
  }

//********************************************** Load Products ********************************************** */
  Future<void> loadProducts() async {

    final loadedProducts = await _productRepository.getProducts(_skipCurrent);

    add( ProductsLoaded(productsLoaded: loadedProducts ) );

    _skipCurrent += 12;
  }

  void _loadProductsHanlder( ProductsLoaded event, Emitter<ProductsState> emit ) {
    emit( state.copyWith( products: [ ...state.products ,...event.productsLoaded ] ) );
  }

//********************************************** Select Product ********************************************** */
  void selectProduct( Product productSelected ) {
    add( ProductSelected(productSelected: productSelected) );
  }

  void _selectedProductHandler( ProductSelected event, Emitter<ProductsState> emit ) {
    emit( state.copyWith( productSelected: event.productSelected ));
  }

//********************************************** Search Product ********************************************** */
  Future<List<Product>> loadSearchedProducts( String product ) async {

    final searchedProducts = await _productRepository.searchProducts(product);

    add( ProductSearch( productsSearched: searchedProducts, product: product ) );

    return searchedProducts;
  }

  Future<List<Product>> loadProductsByCategorie( String product ) async {

    final searchedProducts = await _productRepository.getProductsByCategorie(product);

    add( ProductSearch( productsSearched: searchedProducts, product: product ) );

    return searchedProducts;
  }

  void _searchProduct( ProductSearch event, Emitter<ProductsState> emit ) {
    emit( state.copyWith( productsSearched: event.productsSearched ) );
  }

}
