import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:practices/features/products/presentation/bloc/blocs.dart';

class SearchProductScreen extends StatelessWidget {

  final String prodcutsSearched;
  final bool showByCategorie;

  const SearchProductScreen({
    Key? key,
    required this.prodcutsSearched,
    required this.showByCategorie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final sizeHeight = MediaQuery.of(context).size.height;

    final onFunction = showByCategorie ?
    context.read<ProductsBloc>().loadProductsByCategorie( prodcutsSearched.toLowerCase() ) :
    context.read<ProductsBloc>().loadSearchedProducts( prodcutsSearched.toLowerCase() );

    return Scaffold(
      appBar: AppBar(
        title: Text(prodcutsSearched),
      ),
      body  : SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric( horizontal: 20 ),
          width : double.infinity,
          height: (sizeHeight * 0.88 ),
          child : FutureBuilder(
            future : onFunction,
            builder: (context, snapshot) {

              if( snapshot.connectionState == ConnectionState.waiting ) {
                return const Center(child: CircularProgressIndicator());
              }
        
              if ( snapshot.hasError ) {
                return const Center(child: Text('Something went wrong', style: TextStyle( fontSize: 20 ) ) );
              }

              if ( snapshot.data!.isEmpty ) {
                // return Image.asset('assets/images/no-data.jpg', fit: BoxFit.cover, );
                return SvgPicture.asset(
                  'assets/images/no-data.svg',
                  semanticsLabel : 'No data',
                  fit             : BoxFit.cover,
                ).animate().scale( curve: Curves.easeInOutSine, duration: 500.ms );
              }

              return GridView.custom(
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

                    final product = snapshot.data?[index];

                    return GestureDetector(
                      onTap: () {
                        context.read<ProductsBloc>().selectProduct(product);
                        context.push('/products/detail-product');
                      },
                      child: Stack(
                        children: [
                                        
                          Container(
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
                                image: NetworkImage( product!.thumbnail! ),
                                fit   : BoxFit.cover,
                              ),
                            ),
                          ),
                                        
                          Positioned(
                            bottom: 0,
                            left  : 0,
                            right : 0,
                            child : Container(
                              padding: const EdgeInsets.symmetric( vertical: 20 ),
                            ).blurred(
                              borderRadius: const BorderRadius.only( bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30) ),
                              blurColor   : Colors.grey.withOpacity(0.9),
                              overlay     : Padding(
                                padding: const EdgeInsets.symmetric( horizontal: 12 ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(product.title!, style: const TextStyle( color: Colors.white, fontWeight: FontWeight.w700 ),maxLines: 1, )
                                    ),
                            
                                    const SizedBox( width: 5 ),
                            
                                    Expanded(
                                      flex: 0,
                                      child: Row(
                                        children: [
                                          const Icon(Icons.star, color: Colors.amber, size: 18 ),
                                          Text('${product.rating}', style: const TextStyle( color: Colors.white, fontWeight: FontWeight.w700 ), maxLines: 1, )
                                        ],
                                      )
                                    ),
                                  ],
                                ),
                              )
                            ),
                          ),
                        ],
                      ).animate().scale( delay:Duration( milliseconds: ( index * 20 ) ) ),
                    );
                  },
                  childCount            : snapshot.data?.length,
                  addAutomaticKeepAlives: true,
                )
              );
            }
          ),
        ),
      ),
    );
  }

}
