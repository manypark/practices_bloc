part of 'login_form_bloc.dart';

class LoginFormState extends Equatable {

  final String email;
  final String pass;
  final String name;

  const LoginFormState({
    this.email = '',
    this.pass = '',
    this.name = '',
  });
  
  @override
  List<Object> get props => [email, pass, name];
}
