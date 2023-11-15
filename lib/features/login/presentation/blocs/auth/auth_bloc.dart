import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:practices/features/login/infrastructure/infrastructure.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  final _authDatasource = LoginUserRepositoryImpl();

  AuthBloc() : super( const AuthState() ) {
    on<AuthUserFirebase>(_createUserFirebaseHanlder);
  }

  Future<(String, User?)> onCreateUserFirebase( String email, String password ) async {

    try {
      final newUser = await _authDatasource.createUserWithEmailAndPassword(email, password);

      add( AuthUserFirebase(user: newUser!) );

      return ( 'User new created', newUser );
    } catch (e) {
      return (e.toString(), null);
    }

  }

  _createUserFirebaseHanlder( AuthUserFirebase event ,Emitter<AuthState> emit ) {
    emit( state.copyWith( user: event.user ) );
  }

}
