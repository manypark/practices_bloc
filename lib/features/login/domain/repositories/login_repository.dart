import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginUserRepository {
  Future<bool> verifyEmail( String email );
  Future<User?> createUserWithEmailAndPassword( String email, String password );
  Future<User?> signinUserWithEmailAndPassword( String email, String password );
}
