import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_google_event.dart';
part 'auth_google_state.dart';

class AuthGoogleBloc extends Bloc<AuthGoogleEvent, AuthGoogleState> {
  AuthGoogleBloc() : super( const AuthGoogleState() ) {
    on<LoginSucessfuly>(_loginWithGoogleHandler);
  }

  void loginWithGoogle( String fullName, String email, String urlPhoto ) {
    add( LoginSucessfuly(email: email, fullName: fullName, urlPhoto: urlPhoto) );
  }

  _loginWithGoogleHandler( LoginSucessfuly event, Emitter<AuthGoogleState> emit ) {
    emit(state.copyWith( email: event.email, fullName: event.fullName, urlPhoto: event.urlPhoto ) );
  }

}
