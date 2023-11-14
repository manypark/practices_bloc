part of 'login_form_bloc.dart';

class LoginFormState extends Equatable {

  final String email;
  final String pass;
  final String name;
  final bool ifExsitEmail;
  final bool isLoading;

  const LoginFormState({
    this.email = '',
    this.pass = '',
    this.name = '',
    this.ifExsitEmail = false,
    this.isLoading = false,
  });
  
  @override
  List<Object> get props => [email, pass, name, ifExsitEmail, isLoading];

  LoginFormState copyWith({
    String? email,
    String? pass,
    String? name,
    bool? ifExsitEmail,
    bool? isLoading,
  }) {
    return LoginFormState(
      email: email ?? this.email,
      pass: pass ?? this.pass,
      name: name ?? this.name,
      ifExsitEmail: ifExsitEmail ?? this.ifExsitEmail,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  String toString() {
    return 'Email: $email, isLoading: $isLoading, ifExistEmail: $ifExsitEmail';
  }
}
