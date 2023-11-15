part of 'login_form_bloc.dart';

class LoginFormState extends Equatable {

  final String email;
  final String pass;
  final String name;
  final bool ifExsitEmail;
  final bool isLoading;
  final bool showSignupView;

  const LoginFormState({
    this.email = '',
    this.pass = '',
    this.name = '',
    this.ifExsitEmail = false,
    this.isLoading = false,
    this.showSignupView = false,
  });
  
  @override
  List<Object> get props => [email, pass, name, ifExsitEmail, isLoading, showSignupView];

  @override
  String toString() {
    return 'Email: $email, isLoading: $isLoading, ifExistEmail: $ifExsitEmail';
  }

  LoginFormState copyWith({
    String? email,
    String? pass,
    String? name,
    bool? ifExsitEmail,
    bool? isLoading,
    bool? showSignupView,
  }) {
    return LoginFormState(
      email: email ?? this.email,
      pass: pass ?? this.pass,
      name: name ?? this.name,
      ifExsitEmail: ifExsitEmail ?? this.ifExsitEmail,
      isLoading: isLoading ?? this.isLoading,
      showSignupView: showSignupView ?? this.showSignupView,
    );
  }
}
