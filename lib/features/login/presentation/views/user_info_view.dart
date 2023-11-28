import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:practices/config/config.dart';
import 'package:practices/features/home/presentation/bloc/dark_mode_bloc.dart';

import 'package:practices/features/login/presentation/blocs/blocs.dart';

class InfoUserView extends StatelessWidget {

  const InfoUserView({super.key});

  @override
  Widget build(BuildContext context) {
    
    return ThemeSwitchingArea(
      child: Scaffold(
        appBar: AppBar(),
        body  : const InfoUser(),
      ),
    );
  }

}

class InfoUser extends StatelessWidget {

  const InfoUser({super.key});

  @override
  Widget build(BuildContext context) {

    final authWithGoogleBloc = context.watch<AuthGoogleBloc>().state;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children          : [
      
          // Image from user, email and name
          Padding(
            padding : const EdgeInsets.symmetric( horizontal: 20 ),
            child: Stack(
              children: [
            
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child       : SizedBox(
                    width : double.infinity,
                    height: 350,
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
            
                Positioned(
                  right : 0,
                  left  : 0,
                  bottom: 0,
                  child : ClipRRect(
                    borderRadius: const BorderRadius.only( bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30) ),
                    child       : Container(
                      width: double.infinity,
                      height: 120,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin : Alignment.bottomCenter,
                          end   : Alignment.topCenter,
                          colors: [
                            Colors.black,
                            Colors.black.withOpacity(0.1),
                          ],
                        )
                      )
                    ).blurred(
                      blur    : 3,
                      colorOpacity: 0.1,
                      overlay : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children          : [
                          Text(authWithGoogleBloc.fullName, style: const TextStyle( color: Colors.white, fontSize: 22 ) ),
                          Text(authWithGoogleBloc.email, style: const TextStyle( color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600 ) ),
                        ],
                      )
                    ),
                  ),
                ),
            
              ],
            ),
          ),
      
          const SizedBox( height: 20 ),
      
          const Padding(
            padding : EdgeInsets.symmetric( vertical: 10 ),
            child   : Divider(),
          ),
          
          // Settings
          const Padding(
            padding : EdgeInsets.symmetric( horizontal: 20 ),
            child   : ListTile(
              leading : Icon( Icons.settings, size: 40 ),
              title   : Text('Settings'),
              trailing: Icon( Icons.arrow_forward_ios_rounded ),
            ),
          ),
      
          const Padding(
            padding : EdgeInsets.symmetric( vertical: 10 ),
            child   : Divider(),
          ),
          
          // Settings
          const SwitchThemeOption(),
      
          const Padding(
            padding : EdgeInsets.symmetric( vertical: 10 ),
            child   : Divider(),
          ),
          
          // Settings
          const Padding(
            padding : EdgeInsets.symmetric( horizontal: 20 ),
            child   : ListTile(
              leading : Icon( Icons.question_mark_rounded, size: 40 ),
              title   : Text('Help'),
              trailing: Icon( Icons.arrow_forward_ios_rounded ),
            ),
          ),
      
          const Padding(
            padding : EdgeInsets.symmetric( vertical: 10 ),
            child   : Divider(),
          ),
      
          Padding(
            padding : const EdgeInsets.symmetric( horizontal: 20 ),
            child   : TextButton(
              onPressed : () {
            
              }, 
              child     : const Text('Logout', style: TextStyle( fontSize: 24, color: Colors.red ),)
            ),
          )
        ],
      ),
    );
  }

}


class SwitchThemeOption extends StatelessWidget {

  const SwitchThemeOption({super.key});

  @override
  Widget build(BuildContext context) {
    
  final darkModeBloc = context.watch<DarkModeBloc>().state.isDarkMode;

    return ThemeSwitcher(
      clipper: const ThemeSwitcherCircleClipper(),
      builder: ( context ) {

        return Padding(
          padding : const EdgeInsets.symmetric( horizontal: 20 ),
          child   : ListTile(
            leading : Icon( !darkModeBloc ? Icons.light_mode_outlined : Icons.dark_mode_outlined, size: 40 ),
            title   : Text( !darkModeBloc ? 'Light' : 'Dark'),
            trailing: Switch(
              value     : darkModeBloc,
              onChanged : ( value ) {

                final brightness = ThemeModelInheritedNotifier.of(context).theme.brightness;
        
                ThemeSwitcher.of(context).changeTheme(
                  theme     : brightness == Brightness.light ? AppTheme().getThemedark() : AppTheme().getThemeLight(),
                  isReversed: brightness == Brightness.light ? true : false,
                );

                context.read<DarkModeBloc>().changeDarkMode();
              }
            ),
          ),
        );
      }
    );
  }
}