import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practices/features/login/presentation/blocs/blocs.dart';

class InfoUserView extends StatelessWidget {

  const InfoUserView({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(),
      body  : const InfoUser(),
    );
  }

}

class InfoUser extends StatelessWidget {

  const InfoUser({super.key});

  @override
  Widget build(BuildContext context) {

    final authWithGoogleBloc = context.watch<AuthGoogleBloc>().state;
    final textStyles = Theme.of(context).textTheme;

    return Padding(
      padding : const EdgeInsets.symmetric( horizontal: 20 ),
      child   : Column(
        children: [
      
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child       : SizedBox(
              width : double.infinity,
              height: 400,
              child : CachedNetworkImage(
                progressIndicatorBuilder: (context, url, progress) => Center(
                  child: CircularProgressIndicator( value: progress.progress ),
                ),
                imageUrl    : authWithGoogleBloc.urlPhoto,
                errorWidget : (context, url, error) => Text('Algo salio mal: $error'),
                fit         : BoxFit.cover,
              ),
            ),
          ),
      
          const SizedBox( height: 20 ),
      
          Text(authWithGoogleBloc.fullName, style: textStyles.titleMedium ),
      
          const SizedBox( height: 10 ),
      
          Text(authWithGoogleBloc.email, style: textStyles.titleSmall ),
        ],
      ),
    );
  }

}
