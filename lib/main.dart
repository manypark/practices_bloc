import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practices/config/config.dart';
import 'package:practices/features/products/presentation/bloc/blocs.dart';

void main() {
  serviceLocatorInit();
  runApp(const BlocsProviders());
}

class BlocsProviders extends StatelessWidget {

  const BlocsProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers : [
        BlocProvider(create: (context) => getIt<ProductsBloc>(), lazy: false ),
      ],
      child : const MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {

  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title       : 'Practices Bloc',
      routerConfig : appRouter,
      theme       : AppTheme().getTheme(),
    );
  }

}
