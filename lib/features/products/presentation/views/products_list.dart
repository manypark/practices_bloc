import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:practices/features/products/presentation/bloc/blocs.dart';
import 'package:practices/shared/shared.dart';

class ProductList extends StatefulWidget {

  const ProductList({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  final _scrollController = ScrollController();
  bool _isEndReached = false;

  @override
  void initState() {
    context.read<ProductsBloc>().loadPokemons();
    super.initState();

    _scrollController.addListener(() async {

      if(context.read<ProductsBloc>().state.products.length == 100) return;

      if ( _scrollController.position.pixels == _scrollController.position.maxScrollExtent ) {

        if (!_isEndReached) {

          _isEndReached = true;

          await context.read<ProductsBloc>().loadPokemons();

          double scrollPosition = _scrollController.position.pixels + 100;

          scrollToPosition(scrollPosition);
        }

      } else {
        _isEndReached = false;
      }

    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

   void scrollToPosition(double position) {
    _scrollController.animateTo(
        position,
        duration: const  Duration(milliseconds: 500), 
        curve   : Curves.ease
      );
    }

  @override
  Widget build(BuildContext context) {

    final productsBloc = context.watch<ProductsBloc>();

    return Center(
      child: SizedBox(
        width : double.infinity,
        height: 550,
        child: GridView.builder(
          controller            : _scrollController,
          scrollDirection       : Axis.horizontal,
          addAutomaticKeepAlives: true,
          shrinkWrap            : true,
          gridDelegate          : const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount  : 3,
            mainAxisSpacing : 12.0,
            crossAxisSpacing: 12.0,
          ),
          itemCount  : productsBloc.state.products.length,
          itemBuilder: (context, index) {

            final products = productsBloc.state.products[index];
            
            return FadeIn(
              child: GestureDetector(
                onTap: () {
                  context.read<ProductsBloc>().selectProduct(products);
                  context.push('/products/detail-product');
                },
                child: CustomCardImage(
                  urlImg: products.thumbnail!,
                  rating: products.rating!,
                  title : products.title!,
                  index : products.id!,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
