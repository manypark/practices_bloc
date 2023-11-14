import 'package:get_it/get_it.dart';
import 'package:practices/features/login/presentation/bloc/login_form_bloc.dart';
import 'package:practices/features/products/presentation/bloc/blocs.dart';

GetIt getIt = GetIt.instance;

void serviceLocatorInit() {
  getIt.registerSingleton( ProductsBloc() );
  getIt.registerSingleton( LoginFormBloc() );
}