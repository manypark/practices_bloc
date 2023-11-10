part of 'products_bloc.dart';

class ProductsState extends Equatable {

  final List<Product> products;
  final List<Product> productsSearched;
  final Product? productSelected;

  const ProductsState({
    this.products = const [],
    this.productsSearched = const [],
    this.productSelected,
  });
  
  @override
  List<Object?> get props => [ products, productSelected, productsSearched ];

  ProductsState copyWith({
    List<Product>? products,
    List<Product>? productsSearched,
    Product? productSelected,
  }) {
    return ProductsState(
      products: products ?? this.products,
      productsSearched: productsSearched ?? this.productsSearched,
      productSelected: productSelected ?? this.productSelected,
    );
  }
  
}
