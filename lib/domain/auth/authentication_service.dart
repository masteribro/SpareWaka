import 'package:firebase_auth/firebase_auth.dart';

import 'authentication_client.dart';

class AuthenticationService {
   final AuthenticationClient authenticationClient;
  AuthenticationService({required this.authenticationClient});

  Future<UserCredential?> signInWithEmail(String email, String password) async {
    return await authenticationClient.signInWithEmail(email, password);
  }

  Future<UserCredential?> signInWithGoogle() async {
    return await authenticationClient.signInWithGoogle();
  }

  Future<void> signOut() async {
    await authenticationClient.signOut();}

}