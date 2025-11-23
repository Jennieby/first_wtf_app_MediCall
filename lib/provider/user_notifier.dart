import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_wtf_app/models/user_details.dart';
import 'package:first_wtf_app/widgets/message.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserNotifier extends ChangeNotifier {
  UserDetails? loggedInUser;

  void login(BuildContext context, String email, String password) async {
    try {
      // create user on firebase
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      //fetch user record from firestore
      DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(email)
          .get();

      Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;

      UserDetails userDetail = UserDetails.fromJson(data);

      loggedInUser = userDetail;
      // alert user on success
      snackMessage(context, "Access Granted");
      // take user to home page
      Navigator.of(context).pushReplacementNamed("/home");
    } on FirebaseAuthException catch (e) {
      snackMessage(context, e.message ?? "permission denied");
    } catch (e) {
      snackMessage(context, e.toString());
    }
    notifyListeners();
  }

  Future<void> signup({
    required String username,
    required String password,
    required String email,
    required BuildContext context,
  }) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        // create user on firebase auth
        UserCredential user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        // create user detail object
        var signInUser = UserDetails(name: username, email: email);

        // store to fire store
        await FirebaseFirestore.instance
            .collection("users")
            .doc(email)
            .set(signInUser.toJson());

        loggedInUser = signInUser;

        // alert on user success
        snackMessage(context, "User $username successsfully created");

        // take user to home page
        Navigator.of(context).pushReplacementNamed("/home");
      } on FirebaseAuthException catch (e) {
        snackMessage(context, e.message ?? "error occured");
      } catch (e) {
        snackMessage(context, e.toString());
      }
    } else {
      snackMessage(context, "Input fields cannot be empty");
    }
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn.instance
          .authenticate();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = googleUser!.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      UserCredential user = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );
      print(user);
    } on FirebaseAuthException catch (e) {
      snackMessage(context, e.message ?? "error occured");
    } catch (e) {
      snackMessage(context, e.toString());
    }
  }

  void logout() {
    FirebaseAuth.instance.signOut();
    loggedInUser = null;
  }
}
