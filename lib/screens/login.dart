import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:hanafuda_record/firebase_options.dart';
import 'package:hanafuda_record/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final googleLogin = GoogleSignIn(
        clientId: DefaultFirebaseOptions.currentPlatform.iosClientId);

    Firebase.initializeApp();
    Future<void> signIn() async {
      // Google認証
      GoogleSignInAccount? signinAccount = await googleLogin.signIn();
      if (signinAccount == null) {
        return;
      }

      // Firebaseへの認証情報を取得
      GoogleSignInAuthentication auth = await signinAccount.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        idToken: auth.idToken,
        accessToken: auth.accessToken,
      );

      // 認証情報をFirebaseAuthenticationに登録
      User? user =
          (await FirebaseAuth.instance.signInWithCredential(credential)).user;
      // ログイン成功
      if (user != null) {
        if (!mounted) return;
        // ログイン成功と同時にHomeへ遷移
        Navigator.of(context).pushReplacementNamed(Routes.home);

        // FireStoreにusersを追加
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set(
          {
            'username': user.displayName,
            'email': user.email,
          },
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginPage'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: signIn,
          child: const Text('Login'),
        ),
      ),
    );
  }
}
