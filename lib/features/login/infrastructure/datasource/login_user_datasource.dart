import 'package:firebase_auth/firebase_auth.dart';
import 'package:practices/features/login/domain/domain.dart';

class LoginUserDatasourceImpl extends LoginUserDatasource {

  @override
  Future<bool> verifyEmail(String email) async {

    try {
      return email == 'manu@live.com';
    } catch (e) {
      throw Exception(e .toString() );
    }
    
  }

  @override
  Future<User?> createUserWithEmailAndPassword(String email, String password) async {

    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email   : email,
        password: password,
      );

      return credential.user;

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      }
    } catch (e) {
      throw Exception( e.toString() );
    }

    return null;
  }

  @override
  Future<User?> signinUserWithEmailAndPassword(String email, String password) async {

    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email   : email,
        password: password
      );

      return credential.user
      ;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided for that user.');
      }
    }
    return null;
  }
  
}
