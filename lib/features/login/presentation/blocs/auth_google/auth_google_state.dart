part of 'auth_google_bloc.dart';

class AuthGoogleState extends Equatable {

  final String fullName;
  final String email;
  final String urlPhoto;

  const AuthGoogleState({
    this.fullName = '', 
    this.email = '', 
    this.urlPhoto = '',
  });

  @override
  List<Object> get props => [fullName, email, urlPhoto];

  AuthGoogleState copyWith({
    String? fullName,
    String? email,
    String? urlPhoto,
  }) {
    return AuthGoogleState(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      urlPhoto: urlPhoto ?? this.urlPhoto,
    );
  }
}
