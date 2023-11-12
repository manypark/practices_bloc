import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'views/products_list.dart';
import 'views/search_product_input.dart';
import 'package:practices/config/config.dart';


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
    
    List<String> categories = CategoriesProducts.categories;

    return Padding(
      padding : const EdgeInsets.symmetric( horizontal: 20 ),
      child   : SingleChildScrollView(
        physics : const NeverScrollableScrollPhysics(),
        child   : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            // title
            const Text('Products for everyone', style: TextStyle( fontSize: 24, fontWeight: FontWeight.w700) )
            .animate().fadeIn(),
      
            const SizedBox( height: 15 ),
      
            // input search products
            const SearchProductInputView(),
      
            const SizedBox( height: 25 ),

            // categories
            SizedBox(
              width : double.infinity,
              height: 36,
              child : ListView.builder(
                scrollDirection : Axis.horizontal,
                itemCount       : categories.length,
                itemBuilder     : (context, index) {
            
                  return Container(
                    margin: const EdgeInsets.only( right: 12 ),
                    child : OutlinedButton(
                        onPressed : () => context.push('/products/search-product/${categories[index]}/1'),
                        style     : ButtonStyle(
                          side  : MaterialStateProperty.all<BorderSide>( BorderSide.none ),
                          shape : MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder( borderRadius: BorderRadius.circular(24) )
                          ),
                          backgroundColor:MaterialStateProperty.all<Color>(Colors.grey.shade200),
                        ),
                        child : Text(categories[index], style: const TextStyle( color: Colors.black ) ),
                      ),
                  ).animate().fadeIn().scale( duration: 500.ms );
                }
              ),
            ),

            const SizedBox( height: 25 ),

            // title top products
            const Row(
              mainAxisAlignment : MainAxisAlignment.spaceBetween,
              children          : [
                Text('Top propducts', style: TextStyle( fontSize: 20, fontWeight: FontWeight.w700),),
                Icon( Icons.menu_rounded )
              ],
            ),

            // list of products
            const ProductList(),
          ],
        ),
      ),
    );
  }
}
