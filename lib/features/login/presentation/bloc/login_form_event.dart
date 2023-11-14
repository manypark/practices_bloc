part of 'login_form_bloc.dart';

sealed class LoginFormEvent extends Equatable {
  const LoginFormEvent();
  @override
  List<Object> get props => [];
}

class LoginOption extends LoginFormEvent {
  
  final String email;
  final bool ifExsitEmail;

  const LoginOption({
    this.email = '', 
    this.ifExsitEmail = false
  });
}
