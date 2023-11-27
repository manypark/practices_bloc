import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomCardImage extends StatelessWidget {

  final String urlImg;
  final double rating;
  final String title;
  final int index;

  const CustomCardImage({
    super.key, 
    required this.urlImg, 
    required this.rating, 
    required this.title, 
    required this.index, 
  });

  @override
  Widget build(BuildContext context) {

    final sizeWidth = MediaQuery.of(context).size.width;

    return Container(
      padding : const EdgeInsets.all(6),
      width   : double.infinity,
      child   : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment : MainAxisAlignment.spaceBetween,
        children          : [
        
          Stack(
            children: [

              //Preview product image
              // Hero(
              //   tag  : 'image$index',
              //   child: Container(
              //     width : double.infinity,
              //     height: 140,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(30),
              //       image       : DecorationImage(
              //         image : NetworkImage(urlImg),
              //         fit   : BoxFit.cover,
              //       )
              //     ),
              //   ),
              // ),

              Hero(
                tag  : 'image$index',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child       : SizedBox(
                    width : double.infinity,
                    height: 140,
                    child : CachedNetworkImage(
                      progressIndicatorBuilder: (context, url, progress) => Center(
                        child: CircularProgressIndicator( value: progress.progress ),
                      ),
                      imageUrl    : urlImg,
                      errorWidget : (context, url, error) => Text('Algo salio mal: $error'),
                      fit         : BoxFit.cover,
                    ),
                  ),
                ),
              ),

              // Rating
              Positioned(
                top : 5,
                left: (sizeWidth * 0.25),
                child: Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                      boxShadow : [
                          BoxShadow(
                            blurRadius: 10,
                            color     : Colors.black26,
                            offset    : Offset(0, 0),
                          )
                        ]
                      ),
                      child: Text('$rating', style: const TextStyle(color: Colors.white ) ),
                    ),
                    const SizedBox( width: 5,),
                    const Icon(Icons.star, color: Colors.amber, size: 18, ),
                  ],
                ),
              )
            ],
          ),

          //NAme product
          Padding(
            padding : const EdgeInsets.symmetric( horizontal: 5 ),
            child   : Text(title, style: const TextStyle( fontWeight: FontWeight.w600, overflow: TextOverflow.ellipsis ), maxLines: 1, ),
          ),
        ].animate(interval: const Duration( milliseconds: 400 ) ).fadeIn().scale( duration: const Duration( milliseconds: 400 )),
      ),
    );
  }
}