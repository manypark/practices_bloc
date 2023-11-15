import 'package:practices/features/login/domain/domain.dart';

class LoginUserDatasourceImpl extends LoginUserDatasource{

  @override
  Future<bool> verifyEmail(String email) async {

    try {
      return email == 'jane.doe@live.com';
    } catch (e) {
      throw Exception(e .toString() );
    }
    
  }
  
}
