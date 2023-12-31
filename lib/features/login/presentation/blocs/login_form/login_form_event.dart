part of 'login_form_bloc.dart';

sealed class LoginFormEvent extends Equatable {
  const LoginFormEvent();
  @override
  List<Object> get props => [];
}

class ResetState extends LoginFormEvent {}

class ShowSignupView extends LoginFormEvent {

  final String email;
  final bool showSignupView;

  const ShowSignupView({
    this.email = '',
    this.showSignupView = false
  });
  
  @override
  List<Object> get props => [email, showSignupView];
}

class LoginOption extends LoginFormEvent {
  
  final String email;
  final bool ifExsitEmail;
  final bool isLoading;

  const LoginOption({
    this.email = '', 
    this.ifExsitEmail = false,
    this.isLoading = false,
  });

  @override
  List<Object> get props => [email, ifExsitEmail, isLoading];  
}
