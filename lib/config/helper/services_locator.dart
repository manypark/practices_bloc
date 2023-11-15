import 'package:get_it/get_it.dart';
import '../../features/login/presentation/blocs/blocs.dart';
import 'package:practices/features/products/presentation/bloc/blocs.dart';

GetIt getIt = GetIt.instance;

void serviceLocatorInit() {
  getIt.registerSingleton( ProductsBloc() );
  getIt.registerSingleton( LoginFormBloc() );
  getIt.registerSingleton( AuthBloc() );
}