import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';

final firebaseAuthProvider = Provider<FirebaseAuthService>((ref) {
  return FirebaseAuthService(ref);
});

class FirebaseAuthService {
  FirebaseAuthService(this.ref);

  final FirebaseAuth auth = FirebaseAuth.instance;

  final ProviderRef ref;

  Future<bool> signInWithGoogle() async {
    bool isSignedIn = false;
    try {
      //this will provide goole methods to sign in
      final GoogleSignIn googleSignIn = GoogleSignIn();
      //this will show the native google sign in screen
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      //this will provide tokkens and ids the user with firebase
      final GoogleSignInAuthentication? googleSignInAuthentication =
          await googleSignInAccount?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication?.accessToken,
        idToken: googleSignInAuthentication?.idToken,
      );

      UserCredential userCredential =
          await auth.signInWithCredential(credential);
      User? user = userCredential.user;
      if (user != null) {
        isSignedIn = true;
      }
    } catch (e) {
      isSignedIn = false;
      Logger().e(e);
      EasyLoading.showError(e.toString());
    }
    return isSignedIn;
  }
}
