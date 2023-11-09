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

  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {

      if( (scrollController.position.pixels + 50) >= scrollController.position.maxScrollExtent ) {
        // context.read<ProductsBloc>().loadPokemons();
      }

    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Center(
      child: SizedBox(
        width : double.infinity,
        height: 550,
        child: FutureBuilder(
          future  : context.read<ProductsBloc>().loadPokemons(), 
          builder : (context, snapshot) {
            
            if( snapshot.connectionState == ConnectionState.waiting ) {
              return const Center(child: CircularProgressIndicator());
            }
      
            if ( snapshot.hasError ) {
              return const Center(child: Text('Something went wrong', style: TextStyle( fontSize: 24 ) ) );
            }
    
            return GridView.builder(
              controller            : scrollController,
              scrollDirection       : Axis.horizontal,
              addAutomaticKeepAlives: true,
              shrinkWrap            : true,
              gridDelegate          : const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount  : 3,
                mainAxisSpacing : 12.0,
                crossAxisSpacing: 12.0,
              ), 
              itemCount  : snapshot.data!.toList().length,
              itemBuilder: (context, index) {
    
                final products = snapshot.data?[index];
                
                return FadeIn(
                  child: GestureDetector(
                    onTap: () {
                      context.read<ProductsBloc>().selectProduct(products);
                      context.push('/products/detail-product');
                    },
                    child: CustomCardImage(
                      urlImg: products!.thumbnail!,
                      rating: products.rating!,
                      title : products.title!,
                      index : products.id!,
                    ),
                  ),
                );
              },
            );
    
          },
        ),
      ),
    );
  }
}
