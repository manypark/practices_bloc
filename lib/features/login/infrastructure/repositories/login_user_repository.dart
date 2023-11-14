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
  
}