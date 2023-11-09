import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import 'views/products_list.dart';
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
    
    int value = 0;
    List<String> categories = CategoriesProducts.categories;

    return Padding(
      padding : const EdgeInsets.symmetric( horizontal: 20 ),
      child   : SingleChildScrollView(
        physics : const NeverScrollableScrollPhysics(),
        child   : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            // title
            FadeIn(
              duration: const Duration( milliseconds: 800 ),
              child: const Text('Products for everyone', style: TextStyle( fontSize: 24, fontWeight: FontWeight.w700) )
            ),
      
            const SizedBox( height: 15 ),
      
            // input search products
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

            // categories
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
