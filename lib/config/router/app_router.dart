import 'package:go_router/go_router.dart';
import 'package:practices/features/home/home.dart';
import 'package:practices/features/products/products.dart';

final appRouter = GoRouter(routes: [

  GoRoute(
    path    : '/',
    builder : (context, state) => const HomeScreen(),
  ),

  GoRoute(
    path    : '/products',
    builder : (context, state) => const ProductScreen(),
    routes  : [

      GoRoute(
        path    : 'detail-product',
        builder : (context, state) => const ProductDetailView(),
      ),

    ]
  ),

]);