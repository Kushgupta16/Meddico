import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:meddico/Screen/bottomnav.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn();

  static Future<UserCredential?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) return null;
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await _auth.signInWithCredential(credential);
  }
}

// class AuthService {
//   static final FirebaseAuth _auth = FirebaseAuth.instance;
//   static final GoogleSignIn _googleSignIn = GoogleSignIn();

//   static Future<UserCredential?> signInWithGoogle() async {
//     // Trigger the authentication flow
//     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

//     if (googleUser == null) {
//       // User canceled the sign-in process
//       return null;
//     }

//     // Obtain the auth details from the request
//     final GoogleSignInAuthentication googleAuth =
//         await googleUser.authentication;

//     // Create a new credential
//     final OAuthCredential credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );

//     // Sign in to Firebase with the Google credential
//     try {
//       final UserCredential userCredential =
//           await _auth.signInWithCredential(credential);
//       return userCredential;
//     } on FirebaseAuthException catch (e) {
//       print('Failed to sign in with Google: ${e.message}');
//       return null;
//     }
//   }
// }

// class SignInScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () async {
//             UserCredential? userCredential =
//                 await AuthService.signInWithGoogle();
//             if (userCredential != null) {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => Bottomnav()),
//               );
//             }
//           },
//           child: Text('Sign in with Google'),
//         ),
//       ),
//     );
//   }
// }
