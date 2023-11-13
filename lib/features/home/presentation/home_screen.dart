import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        physics: NeverScrollableScrollPhysics(),
        slivers: [
          SliverAppBar( title: Text('Home menu' ) ),
          HomeView(),
        ],
      ),
    );
  }

}

class MenuItem {
  
  final String title;
  final IconData icon;
  final String route;
  final Color bgColor;
  final Color iconColor;

  MenuItem({
    required this.title, 
    required this.icon, 
    required this.route,
    required this.bgColor,
    required this.iconColor,
  });

}

final menuItems = [
  
    MenuItem(
      title     : 'Products', 
      icon      : Icons.shopping_bag_rounded, 
      route     : '/products', 
      bgColor   : const Color(0xffe9ebff), 
      iconColor : const Color(0xffA0AAFF),
    ),

    MenuItem(
      title     : 'Login',
      icon      : Icons.login_rounded, 
      route     : '/login',
      bgColor   : const Color(0xffe9ebff), 
      iconColor : const Color(0xffA0AAFF),
    ),
];

class HomeView extends StatelessWidget {

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {

    // final transitionIn = <Effect>[
    //   FadeEffect(duration: 400.ms, curve: Curves.easeOut),
    //   const ScaleEffect(begin: Offset(0, 8), curve: Curves.easeIn)
    // ];
    
    return SliverGrid.count(
      crossAxisCount  : 3,
      crossAxisSpacing: 10,
      mainAxisSpacing : 10,
      // children        : [
      //     const Text("Before", style: TextStyle( fontSize: 28, color: Colors.blueAccent ) )
      //     .animate()
      //     .fadeOut( delay: 900.ms )
      //     .swap(duration: 300.ms, builder: (_, __) => const Text("After", style: TextStyle( fontSize: 28 )).animate().fadeIn().tint(color: Colors.red)
      //     ),

      //     const Text('Hello').animate( effects: transitionIn )
      // ]

      children: menuItems.map( ( item ) => HomeMenuItem(
          title  : item.title, 
          route  : item.route, 
          icon   : item.icon,
          bgColor:  item.bgColor,
          iconColor: item.iconColor,
        )
      ).toList().animate( interval: 200.ms )
      .scale()
      .move( delay: 100.ms, duration: 400.ms )
      .shimmer( duration: 500.ms )
    );
  }
}

class HomeMenuItem extends StatelessWidget {

  final String title;
  final String route;
  final IconData icon;
  final Color bgColor;
  final Color iconColor;

  const HomeMenuItem({
    super.key, 
    required this.title, 
    required this.route, 
    required this.icon, 
    required this.bgColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => context.push( route ),
      child: Container(
        margin    : const EdgeInsets.all( 12 ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: bgColor
        ),
        child: Column(
          mainAxisAlignment : MainAxisAlignment.center,
          children          : [
    
            Icon(icon, color: iconColor, size: 32 ),
            const SizedBox( height: 10,),
            Text( title, textAlign: TextAlign.center, style: const TextStyle( fontSize: 18 ),)
    
          ],
        ),
      ),
    );
  }

}