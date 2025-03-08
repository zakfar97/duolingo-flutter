import 'package:duolingo/src/firebase/api_response.dart';
import 'package:duolingo/src/model/user.dart' as AppUser; // ✅ Rename your custom User model
import 'package:firebase_auth/firebase_auth.dart' as FirebaseAuth; // ✅ Alias for Firebase's User
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth.FirebaseAuth _auth = FirebaseAuth.FirebaseAuth.instance;

  Future<ApiResponse<void>> loginGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return ApiResponse.error(message: "Google sign-in was canceled.");
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final FirebaseAuth.OAuthCredential credential = FirebaseAuth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final FirebaseAuth.UserCredential result =
      await _auth.signInWithCredential(credential);
      final FirebaseAuth.User? fuser = result.user;

      if (fuser == null) {
        return ApiResponse.error(message: "Failed to retrieve Firebase user.");
      }

      final AppUser.User user = AppUser.User(
        name: fuser.displayName ?? "Unknown",
        login: fuser.email ?? "Unknown",
        email: fuser.email ?? "Unknown",
        urlPhoto: fuser.photoURL ?? "",
      );

      user.save();

      return ApiResponse.ok(message: "Login successful.");
    } catch (error) {
      print("Firebase login error: ${error.toString()}");
      return ApiResponse.error(message: "Failed to login with Google.");
    }
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
      print("User logged out successfully.");
    } catch (error) {
      print("Logout error: ${error.toString()}");
    }
  }
}
