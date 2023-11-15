import 'package:firebase_auth/firebase_auth.dart';
import 'package:practices/features/login/domain/domain.dart';
import 'package:practices/features/login/infrastructure/datasource/login_user_datasource.dart';

class LoginUserRepositoryImpl extends LoginUserRepository {

  final LoginUserDatasourceImpl datasource;

  LoginUserRepositoryImpl({
    LoginUserDatasourceImpl? datasource
  }): datasource = datasource ?? LoginUserDatasourceImpl();

  @override
  Future<bool> verifyEmail(String email) {
    return datasource.verifyEmail(email);
  }

  @override
  Future<User?> createUserWithEmailAndPassword(String email, String password) {
    return datasource.createUserWithEmailAndPassword(email, password);
  }

  @override
  Future<User?> signinUserWithEmailAndPassword(String email, String password) {
    return datasource.signinUserWithEmailAndPassword(email, password);
  }
  
}