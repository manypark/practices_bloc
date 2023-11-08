import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:practices/config/config.dart';
import 'package:practices/shared/shared.dart';
import 'package:practices/features/products/presentation/bloc/blocs.dart';

class ProductScreen extends StatelessWidget {

  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body  : const ProductView(),
      ),
    );
  }
}

class ProductView extends StatelessWidget {

  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    
    int value = 1;
    List<String> categories = CategoriesProducts.categories;

    return Padding(
      padding : const EdgeInsets.symmetric( horizontal: 20 ),
      child   : SingleChildScrollView(
        physics : const NeverScrollableScrollPhysics(),
        child   : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
            FadeIn(
              duration: const Duration( milliseconds: 800 ),
              child: const Text('Products for everyone', style: TextStyle( fontSize: 24, fontWeight: FontWeight.w700) )
            ),
      
            const SizedBox( height: 15 ),
      
            FadeIn(
              duration: const Duration( milliseconds: 800 ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child       : TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Search your product',
                    fillColor: Colors.grey.shade100,
                    filled   : true,
                    border  : InputBorder.none,
                    prefixIcon: const Icon( Icons.search_outlined),
                  ),
                ),
              ),
            ),
      
            const SizedBox( height: 25 ),
      
            SizedBox(
              width: double.infinity,
              height: 36,
              child: ListView.builder(
                scrollDirection : Axis.horizontal,
                itemCount       : categories.length,
                itemBuilder     : (context, index) {
            
                  return FadeInRight(
                    from: (index * 10),
                    child: Container(
                      margin: const EdgeInsets.only( right: 12 ),
                      child : OutlinedButton(
                          onPressed : () {
                    
                          },
                          style: ButtonStyle(
                            side  : MaterialStateProperty.all<BorderSide>( BorderSide.none ),
                            shape : MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder( borderRadius: BorderRadius.circular(24) )
                            ),
                            backgroundColor: (value == index)
                                ? MaterialStateProperty.all<Color>(Colors.grey.shade400)
                                : MaterialStateProperty.all<Color>(Colors.grey.shade200),
                          ),
                          child : Text(categories[index], style: const TextStyle( color: Colors.black ),),
                        ),
                    ),
                  );
                }
              ),
            ),

            const SizedBox( height: 25 ),

            const Row(
              mainAxisAlignment : MainAxisAlignment.spaceBetween,
              children          : [
                Text('Top propducts', style: TextStyle( fontSize: 20, fontWeight: FontWeight.w700),),
                Icon( Icons.menu_rounded )
              ],
            ),

            Center(
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
                      return const Center(child: Text('Something went wrong'));
                    }
            
                    return GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount  : 2,
                        mainAxisSpacing : 12.0,
                        crossAxisSpacing: 12.0,
                      ), 
                      itemCount  : snapshot.data!.toList().length,
                      itemBuilder: (context, index) {
            
                        final products = snapshot.data?[index];
                        
                        return FadeInRight(
                          from : (index * 10 ),
                          child: GestureDetector(
                            onTap: () {
                              context.read<ProductsBloc>().selectProduct(products);
                              context.push('/products/detail-product');
                            },
                            child: CuatomCardImage(
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
            ),
          ],
        ),
      ),
    );
  }
}
