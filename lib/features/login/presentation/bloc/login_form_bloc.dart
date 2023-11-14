import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practices/features/login/infrastructure/infrastructure.dart';

part 'login_form_event.dart';
part 'login_form_state.dart';

class LoginFormBloc extends Bloc<LoginFormEvent, LoginFormState> {

  final _loginUserRepository = LoginUserRepositoryImpl();

  LoginFormBloc() : super( const LoginFormState() ) {
    on<LoginOption>( _loginWithEmailAndPasswordHandler );
  }

  void onVerifyEmail( String email ) async {

    add( const LoginOption( email:'manu', isLoading:true ) );

    await Future.delayed( const Duration( seconds: 2 ) );

    final existEmail = await _loginUserRepository.verifyEmail(email); 

    add( LoginOption( email:email, ifExsitEmail:existEmail, isLoading:false ) );
  }

  _loginWithEmailAndPasswordHandler( LoginOption event, Emitter<LoginFormState> emit) {
    emit( 
      state.copyWith( 
        email       : event.email, 
        ifExsitEmail: event.ifExsitEmail, 
        isLoading   : event.isLoading
      )
    );
  }

}
