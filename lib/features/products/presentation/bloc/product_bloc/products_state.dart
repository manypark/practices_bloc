part of 'products_bloc.dart';

class ProductsState extends Equatable {

  final List<Product> products;
  final Product? productSelected;

  const ProductsState({
    this.products = const [],
    this.productSelected,
  });
  
  @override
  List<Object?> get props => [ products, productSelected ];

  ProductsState copyWith({
    List<Product>? products,
    Product? productSelected,
  }) {
    return ProductsState(
      products: products ?? this.products,
      productSelected: productSelected ?? this.productSelected,
    );
  }

}
