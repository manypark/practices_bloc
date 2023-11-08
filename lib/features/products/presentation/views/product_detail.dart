import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:givestarreviews/givestarreviews.dart';
import 'package:practices/features/products/presentation/bloc/blocs.dart';

class ProductDetailView extends StatelessWidget {

  const ProductDetailView({ super.key });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DetailProduct(),
    );
  }

}

class DetailProduct extends StatelessWidget {

  const DetailProduct({super.key });

  @override
  Widget build(BuildContext context) {

    final productSelected = context.read<ProductsBloc>().state.productSelected;

    return SingleChildScrollView(
      child: Padding(
        padding : const EdgeInsets.symmetric( horizontal: 20 ),
        child   : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            const SizedBox( height: 60,),

            Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: Colors.black12,
                    offset: Offset(0, 10),
                    spreadRadius: 0,
                  )
                ]
              ),
              child: Stack(
                children: [
            
                  Hero(
                    tag  : 'image${productSelected?.id}',
                    child: Container(
                      width : double.infinity,
                      height: 500,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image       : DecorationImage(
                          image: NetworkImage(productSelected!.thumbnail!),
                          fit   : BoxFit.cover,
                        )
                      ),
                    ),
                  ),
            
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Container(
                      width : 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade600,
                      ),
                      child: IconButton(
                        onPressed : () => context.pop(),
                        icon      : const Icon(Icons.arrow_back_ios_outlined, color: Colors.white ) 
                      )
                    ),
                  ),
                ]
              ),
            ),

            const SizedBox( height: 50 ),

            Text(productSelected.title!, style: const TextStyle( fontSize: 28, fontWeight: FontWeight.w700 ) ),

            const SizedBox( height: 10 ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children         : [

                Container(
                  padding   : const EdgeInsets.symmetric( horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Row(
                    children: [

                      const Icon( Icons.ballot_rounded, color: Colors.grey, ),
                      const SizedBox( width: 5 ),
                      Text(productSelected.brand!, style: const TextStyle(fontWeight: FontWeight.w500 ) )
                    ],
                  ),
                ),

                const SizedBox( width: 20 ),

                Container(
                  padding   : const EdgeInsets.symmetric( horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Row(
                    children: [

                      const Icon( Icons.category_rounded, color: Colors.grey, ),
                      const SizedBox( width: 5 ),
                      Text(productSelected.category!, style: const TextStyle(fontWeight: FontWeight.w500 ) )
                    ],
                  ),
                ),

              ],
            ),

            const SizedBox( height: 10 ),

            Row(
              children: [
                Text(productSelected.rating.toString(), style: const TextStyle( fontSize: 28, fontWeight: FontWeight.w700 ) ),
                const SizedBox( width: 5 ),
                Padding(
                  padding : const EdgeInsets.only( top:6 ),
                  child   : Text('Rating', style: TextStyle( fontSize: 14, color: Colors.grey.shade800) ),
                ),
              ],
            ),

            StarRating(
              activeStarColor: Colors.amber,
              size     : 20,
              starCount: 5,
              value    : int.parse( productSelected.rating.toString().substring(0, 1) ),
              onChanged: (rate) {}
            ),

            const SizedBox( height: 30 ),

            const Text('Description', style: TextStyle( fontSize: 24, fontWeight: FontWeight.w600 ) ),

            const SizedBox( height: 10 ),

            Text(
              productSelected.description!,
              style: const TextStyle( fontSize: 18 ), textAlign: TextAlign.justify,
            ),

            const SizedBox( height: 60 ),
          ],
        ),
      ),
    );
  }
}