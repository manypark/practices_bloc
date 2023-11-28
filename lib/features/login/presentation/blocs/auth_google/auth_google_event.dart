part of 'auth_google_bloc.dart';

sealed class AuthGoogleEvent extends Equatable {
  const AuthGoogleEvent();
  @override
  List<Object> get props => [];
}

class LoginSucessfuly extends AuthGoogleEvent {
  
  final String fullName;
  final String email;
  final String urlPhoto;

  const LoginSucessfuly({
    this.fullName = '', 
    this.email = '', 
    this.urlPhoto = ''
  });

  @override
  List<Object> get props => [fullName, email, urlPhoto];


  LoginSucessfuly copyWith({
    String? fullName,
    String? email,
    String? urlPhoto,
  }) {
    return LoginSucessfuly(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      urlPhoto: urlPhoto ?? this.urlPhoto,
    );
  }
}
