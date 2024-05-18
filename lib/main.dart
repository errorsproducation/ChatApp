import 'package:chatapp/Pages/Google_SignUp_Page.dart';
import 'package:chatapp/Pages/Profile_Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  MyApp(),
      ),);
}


class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

   final FirebaseAuth _auth = FirebaseAuth.instance;
   late SharedPreferences sharedPreferences;


   @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

   Future<bool> _checkLoginStatus() async {
     sharedPreferences = await SharedPreferences.getInstance();
     String token = sharedPreferences.getString('id') ?? '';
     return token.isNotEmpty;
   }

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize:  const Size(375, 812),
      builder: (context, child) {
        return Scaffold(
          body:  FutureBuilder(
            future: _checkLoginStatus(),
            builder: (context, snapshot) {
              if(snapshot.data==true){
                return Profile_Screen(sharedPreferences.getString('id').toString());
              }
              else{
                return Google_SignUp_Page();
              }
            },
          ),
        );
      },
    );


  }


}


