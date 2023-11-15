part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object> get props => [];
}

class AuthUserFirebase extends AuthEvent {
  final User user;
  const AuthUserFirebase({required this.user});
  @override
  List<Object> get props => [user];
}