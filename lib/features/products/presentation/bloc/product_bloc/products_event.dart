part of 'products_bloc.dart';

sealed class ProductsEvent extends Equatable {
  const ProductsEvent();
  @override
  List<Object> get props => [];
}


class ProductsLoaded extends ProductsEvent {
  final List<Product> productsLoaded;
  const ProductsLoaded({
    required this.productsLoaded,
  });
  @override
  List<Object> get props => [ productsLoaded ];
}

class ProductSelected extends ProductsEvent {
  final Product productSelected;
  const ProductSelected({required this.productSelected});
  @override
  List<Object> get props => [productSelected];
}

class ProductSearch extends ProductsEvent {
  final String product;
  final List<Product> productsSearched;
  const ProductSearch({
    required this.product,
    required this.productsSearched
  });
  @override
  List<Object> get props => [ product, productsSearched ];
}