import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:practices/features/login/presentation/blocs/blocs.dart';
import 'package:practices/firebase_options.dart';

import 'package:practices/config/config.dart';
import 'package:practices/features/products/presentation/bloc/blocs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        BlocProvider(create: (context) => getIt<LoginFormBloc>(), lazy: false ),
        BlocProvider(create: (context) => getIt<AuthBloc>(), lazy: false ),
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
