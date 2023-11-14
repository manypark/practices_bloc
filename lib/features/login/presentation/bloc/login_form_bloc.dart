import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_form_event.dart';
part 'login_form_state.dart';

class LoginFormBloc extends Bloc<LoginFormEvent, LoginFormState> {

  LoginFormBloc() : super( const LoginFormState() ) {
    on<LoginOption>( _loginWithEmailAndPasswordHandler );
  }

  void onVerifyEmail( String email ) {
    
  }

  _loginWithEmailAndPasswordHandler( LoginOption event, Emitter<LoginFormState> emit) {

  }

}
