import 'package:go_router/go_router.dart';
import 'package:practices/features/home/home.dart';
import 'package:practices/features/login/login.dart';
import 'package:practices/features/login/presentation/views/views.dart';
import 'package:practices/features/products/products.dart';

final appRouter = GoRouter(

  initialLocation : '/',
  routes          : [

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

        GoRoute(
          path    : 'search-product/:product/:showByCategorie',
          builder : (context, state) {

            final product = state.pathParameters['product'];
            final showByCategories = state.pathParameters['showByCategorie'] == '1';

            return SearchProductScreen( prodcutsSearched: product!, showByCategorie: showByCategories );
          },
        ),

      ]
    ),

    GoRoute(
      path    : '/login',
      builder : (context, state) => const LoginFormScreen(),
      routes  : [

        GoRoute(
          path    : 'info-user',
          builder : (context, state) => const InfoUserView(),
        ),
      ] 
    ),

  ]
);