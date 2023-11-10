import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:practices/config/config.dart';

class SearchProductScreen extends StatelessWidget {

  const SearchProductScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final dummyProduct = CategoriesProducts.productsDummy;
    final sizeHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Name'),
      ),
      body  : SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric( horizontal: 20 ),
          width : double.infinity,
          height: (sizeHeight * 0.88 ),
          child : GridView.custom(
            gridDelegate: SliverQuiltedGridDelegate(
              crossAxisCount  : 2,
              mainAxisSpacing : 12,
              crossAxisSpacing: 12,
              repeatPattern   : QuiltedGridRepeatPattern.inverted,
              pattern         : const [
                QuiltedGridTile(1, 1),
                QuiltedGridTile(1, 1),
                QuiltedGridTile(1, 2),
                QuiltedGridTile(1, 1),
              ],
            ),
            childrenDelegate: SliverChildBuilderDelegate( (context, index) {
              return Container(
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.black12,
                      offset: Offset(0, 0),
                      spreadRadius: 0,
                    )
                  ],
                  borderRadius: BorderRadius.circular(30),
                  image       : DecorationImage(
                    image: NetworkImage(dummyProduct[index]['urlImg']),
                    fit   : BoxFit.cover,
                  ),
                ),
              );
              },
              childCount            : dummyProduct.length,
              addAutomaticKeepAlives: true,
            ),
          ),
        ),
      ),
    );
  }

}
