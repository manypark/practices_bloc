import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:practices/features/home/presentation/bloc/dark_mode_bloc.dart';

import 'views/products_list.dart';
import 'views/search_product_input.dart';
import 'package:practices/config/config.dart';


class ProductScreen extends StatelessWidget {

  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final darkModeBloc = context.watch<DarkModeBloc>().state.isDarkMode;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: ThemeSwitchingArea(
        child: Scaffold(
          appBar: AppBar(
            actions: [
              ThemeSwitcher(
                clipper: const ThemeSwitcherCircleClipper(),
                builder: ( context ) {
                  return IconButton(
                    onPressed : () {                

                      final brightness = ThemeModelInheritedNotifier.of(context).theme.brightness;
                  
                      ThemeSwitcher.of(context).changeTheme(
                        // theme     : darkModeBloc ? AppTheme().getThemedark() : AppTheme().getThemeLight(),
                        // isReversed: darkModeBloc ? true : false,
                        theme     : brightness == Brightness.light ? AppTheme().getThemedark() : AppTheme().getThemeLight(),
                        isReversed: brightness == Brightness.light ? true : false,
                      );

                      context.read<DarkModeBloc>().changeDarkMode();
                    },
                    icon      : Icon( darkModeBloc ? Icons.dark_mode_outlined : Icons.light_mode_outlined )
                  );
                }
              ),
            ],
          ),
          body  : const ProductView(),
        ),
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

            // list of products
            const ProductList(),
          ],
        ),
      ),
    );
  }
}
