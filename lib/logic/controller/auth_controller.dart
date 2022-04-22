import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shop_app_getx/models/facebook_model.dart';
import 'package:shop_app_getx/routes/routes.dart';
import 'package:shop_app_getx/utils/helpers.dart';

class AuthController extends GetxController with Helpers {
  bool isVisibility = false;
  bool isCheckBox = false;
  var displayUserName = '';
  var displayUserPhoto = '';
  var displayUserEmail = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var google = GoogleSignIn();
  FaceBookModel? faceBookModel;
  bool isSignedIn = false;
  final GetStorage appLogin = GetStorage();

  void visibility() {
    isVisibility = !isVisibility;
    update();
  }

  void checkBox() {
    isCheckBox = !isCheckBox;
    update();
  }

  /// CREATE ACCOUNT
  Future<bool> createAccount(BuildContext context,
      {required String name,
      required String email,
      required String password}) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        displayUserName = name;
        _auth.currentUser!.updateDisplayName(name);
      });
      update();
      Get.offNamed(Routes.mainScreen);
      return true;
    } on FirebaseAuthException catch (e) {
      showSnackBar(context,
          message: e.message ?? 'Something went wrong, try again!',
          error: true);
      _controllerExceptionCode(context, e.code);
    } catch (error) {
      showSnackBar(context, message: error.toString(), error: true);
    }
    return false;
  }

  ///GOOGLE SIGN UP
  Future googleSignUp() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      displayUserName = googleUser!.displayName!;
      displayUserPhoto = googleUser.photoUrl!;
      displayUserEmail = googleUser.email;
      isSignedIn = true;
      appLogin.write('auth', isSignedIn);
      update();
      Get.offNamed(Routes.mainScreen);
    } catch (error) {
      print(error);
      Get.snackbar(
        'Error!',
        error.toString(),
        colorText: Colors.white,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  ///FaceBook SIGN UP
  Future faceBookSignUp() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    if (loginResult.status == LoginStatus.success) {
      final data = await FacebookAuth.instance.getUserData();
      isSignedIn = true;
      appLogin.write('auth', isSignedIn);
      faceBookModel = FaceBookModel.fromJson(data);
      update();
      Get.offNamed(Routes.mainScreen);
    }
  }

  // AccessToken? _accessToken;
  // FaceBookModel? _currentUser;
  //
  // Future<void> signInFacebook() async {
  //   final LoginResult result = await FacebookAuth.i.login();
  //   if (result.status == LoginStatus.success) {
  //     _accessToken = result.accessToken;
  //     final data = await FacebookAuth.i.getUserData();
  //     FaceBookModel model = FaceBookModel.fromJson(data);
  //     _currentUser = model;
  //   }
  // }

  // Future<UserCredential> faceBookSignUp() async {
  //   // Trigger the sign-in flow
  //   final LoginResult loginResult = await FacebookAuth.instance.login();
  //
  //   // Create a credential from the access token
  //   final OAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(loginResult.accessToken!.token);
  //
  //   // Once signed in, return the UserCredential
  //   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  // }

  /// SIGN-IN
  Future<bool> signIn(BuildContext context,
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      isSignedIn = true;
      appLogin.write('auth', isSignedIn);
      update();
      Get.offNamed(Routes.mainScreen);
      return await _handleEmailValidation(context, userCredential);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context,
          message: e.message ?? 'Something went wrong, try again!',
          error: true);
      _controllerExceptionCode(context, e.code);
    } catch (e) {
      print(e);
    }
    return false;
  }

  /// PASSWORD-RESET
  Future<bool> passwordReset(context, {required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      update();
      Get.back();
      return true;
    } on FirebaseAuthException catch (e) {
      _controllerExceptionCode(context, e.code);
    } catch (e) {
      print(e);
    }
    return false;
  }

  /// SIGN-OUT
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await google.signOut();
      // await FacebookAuth.i.logOut();
      displayUserName = '';
      displayUserPhoto = '';
      isSignedIn = false;
      appLogin.remove('auth');
      update();
      Get.offNamed(Routes.launchScreen);
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        colorText: Colors.white,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  /// HANDLE-CHECK-EMAIL
  Future<bool> _handleEmailValidation(
      BuildContext context, UserCredential userCredential) async {
    if (userCredential.user != null && !userCredential.user!.emailVerified) {
      await userCredential.user!.sendEmailVerification();
      showSnackBar(context,
          message: 'Please, check your email to verify it.', error: true);
      return false;
    }
    return true;
  }

  /// CONTROLLER-EXCEPTION-CODE
  void _controllerExceptionCode(BuildContext context, String code) {
    if (code == 'email-already-in-use') {
      print('email-already-in-use');
      // showSnackBar(context, message: 'email-already-in-use', error: true);
    } else if (code == 'invalid-email') {
      print('invalid-email');
      // showSnackBar(context, message: 'invalid-email', error: true);
    } else if (code == 'operation-not-allowed') {
      print('operation-not-allowed');
      // showSnackBar(context, message: 'operation-not-allowed', error: true);
    } else if (code == 'weak-password') {
      print('weak-password');
      // showSnackBar(context, message: 'weak-password', error: true);
    } else if (code == 'user-disabled') {
      print('user-disabled');
      // showSnackBar(context, message: 'user-disabled', error: true);
    } else if (code == 'user-not-found') {
      print('user-not-found');
      // showSnackBar(context, message: 'user-not-found', error: true);
    } else if (code == 'wrong-password') {
      print('wrong-password');
      // showSnackBar(context, message: 'wrong-password', error: true);
    } else if (code == 'auth/missing-android-pkg-name') {
      print('auth/missing-android-pkg-name');
      // showSnackBar(context, message: 'auth/missing-android-pkg-name', error: true);
    } else if (code == 'auth/missing-continue-uri') {
      print('auth/missing-continue-uri');
      // showSnackBar(context, message: 'auth/missing-continue-uri', error: true);
    } else if (code == 'auth/missing-ios-bundle-id') {
      print('auth/missing-ios-bundle-id');
      // showSnackBar(context, message: 'auth/missing-ios-bundle-id', error: true);
    } else if (code == 'auth/invalid-continue-uri') {
      print('auth/invalid-continue-uri');
      // showSnackBar(context, message: 'auth/invalid-continue-uri', error: true);
    } else if (code == 'auth/unauthorized-continue-uri') {
      print('auth/unauthorized-continue-uri');
      // showSnackBar(context, message: 'auth/unauthorized-continue-uri', error: true);
    } else if (code == 'auth/user-not-found') {
      print('auth/user-not-found');
      // showSnackBar(context, message: 'auth/user-not-found', error: true);

    }
  }
}
