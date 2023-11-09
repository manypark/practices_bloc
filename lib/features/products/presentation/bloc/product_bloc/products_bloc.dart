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
    on<ProductsLoaded>( _loadPokemonsHanlder );
    on<ProductSelected>( _selectedProductHandler );
  }

//********************************************************************************************************************************************************************* */
  Future<void> loadPokemons() async {

    final loadedProducts = await _productRepository.getProducts(_skipCurrent);

    add( ProductsLoaded(productsLoaded: loadedProducts ) );

    _skipCurrent += 12;
  }

  void _loadPokemonsHanlder( ProductsLoaded event, Emitter<ProductsState> emit ) {
    emit( state.copyWith( products: [ ...state.products ,...event.productsLoaded ] ) );
  }

//********************************************************************************************************************************************************************* */
  void selectProduct( Product productSelected ) {
    add( ProductSelected(productSelected: productSelected) );
  }

  void _selectedProductHandler( ProductSelected event, Emitter<ProductsState> emit ) {
    emit( state.copyWith( productSelected: event.productSelected ));
  }

}
