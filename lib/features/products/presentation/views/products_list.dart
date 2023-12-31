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
  bool showVertical = false;

  @override
  void initState() {
    context.read<ProductsBloc>().loadProducts();
    super.initState();

    _scrollController.addListener(() async {

      if(context.read<ProductsBloc>().state.products.length == 100) return;

      if ( _scrollController.position.pixels == _scrollController.position.maxScrollExtent ) {

        if (!_isEndReached) {

          _isEndReached = true;

          await context.read<ProductsBloc>().loadProducts();

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

    return Column(
      children: [

        // title top products
        Row(
          mainAxisAlignment : MainAxisAlignment.spaceBetween,
          children          : [
            const Text('Top propducts', style: TextStyle( fontSize: 20, fontWeight: FontWeight.w700),),
            IconButton(
              onPressed : () => setState( () => showVertical = !showVertical ) ,
              icon      : Icon( showVertical ? Icons.swap_vert : Icons.menu_rounded )
            ),
            // Icon( Icons.menu_rounded )
          ],
        ),

        Center(
          child: SizedBox(
            width : double.infinity,
            height: 550,
            child: GridView.builder(
              controller            : _scrollController,
              scrollDirection       : showVertical ? Axis.vertical : Axis.horizontal,
              addAutomaticKeepAlives: true,
              shrinkWrap            : true,
              gridDelegate          : SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount  : showVertical ? 2 : 3,
                mainAxisSpacing : 12.0,
                crossAxisSpacing: 12.0,
              ),
              itemCount  : productsBloc.state.products.length,
              itemBuilder: (context, index) {

                final products = productsBloc.state.products[index];
                
                return GestureDetector(
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
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
