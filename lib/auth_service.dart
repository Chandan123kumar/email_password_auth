import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential?> loginWithGoogle()async{
    try{
      final googleUser= await GoogleSignIn().signIn();
      final googleAuth=await googleUser?.authentication;
      final cred=await GoogleAuthProvider.credential(idToken: googleAuth?.idToken,accessToken: googleAuth?.accessToken);

      return await _auth.signInWithCredential(cred);
    }catch(e){
      print( e.toString());
    }
    return null;
  }

  Future<User?> createUserWithEmail(String email, String password) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return cred.user;
    } catch (e) {
      print('Something went wrong during sign up: $e');
      return null;
    }
  }
  Future<User?> logInUserWithEmail(String email, String password) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return cred.user;
    } catch (e) {
      print('Something went wrong during login: $e');
      return null;
    }
  }

  Future<void> logOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print('Something went wrong during sign out: $e');
    }
  }
}
