import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:practices/features/products/presentation/bloc/blocs.dart';

class SearchProductScreen extends StatelessWidget {

  final String prodcutsSearched;

  const SearchProductScreen({
    Key? key,
    required this.prodcutsSearched,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final sizeHeight = MediaQuery.of(context).size.height;

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
            future : context.read<ProductsBloc>().loadSearchedProducts( prodcutsSearched.toLowerCase() ),
            builder: (context, snapshot) {

              if( snapshot.connectionState == ConnectionState.waiting ) {
                return const Center(child: CircularProgressIndicator());
              }
        
              if ( snapshot.hasError ) {
                return const Center(child: Text('Something went wrong', style: TextStyle( fontSize: 20 ) ) );
              }

              if ( snapshot.data!.isEmpty ) {
                return Image.asset('assets/images/no-data.jpg', fit: BoxFit.cover, );
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
                          image: NetworkImage( product!.thumbnail! ),
                          fit   : BoxFit.cover,
                        ),
                      ),
                    ).animate().scale( delay:Duration( milliseconds: ( index * 100 ) ) );
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
