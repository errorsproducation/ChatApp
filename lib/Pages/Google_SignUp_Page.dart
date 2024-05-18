import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Profile_Screen.dart';

class Google_SignUp_Page extends StatefulWidget {
  const Google_SignUp_Page({super.key});

  @override
  State<Google_SignUp_Page> createState() => _Google_SignUp_PageState();
}

class _Google_SignUp_PageState extends State<Google_SignUp_Page> {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final ref=FirebaseDatabase.instance.ref("users");


  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn
          .signIn();
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!
          .authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(credential);
      final User? user = userCredential.user;
      if (_auth.currentUser != null) {

        String id= ref.push().key.toString();
         ref.child(id).set({
          "email":"${_auth.currentUser?.email}",
          "name":"${_auth.currentUser?.displayName}",
          "imageurl":"${_auth.currentUser?.photoURL}",
          "id":"$id",
        });
        SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
        await  sharedPreferences.setString('id', id);
        print(sharedPreferences.getString("id"));
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Profile_Screen(sharedPreferences.getString('id').toString())));
      }
    }
    catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: InkWell(
            onTap: () async {
              signInWithGoogle();
            },
            child: Container(
              width: 250,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 25,

                  ),
                  Container(
                    width: 40,
                    height: 40,
                    child: Center(
                      child:  Image.asset(
                        "assets/google.png",
                        width: 25,
                        height: 25,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Row(
                    children: [
                      Center(
                        child: Text("Continue With Google",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
