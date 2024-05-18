
import 'package:chatapp/Pages/Google_SignUp_Page.dart';
import 'package:chatapp/Pages/Personal_Details_Card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Users_Screen.dart';

class Profile_Screen extends StatefulWidget {

  String USER_ID=" ";

   Profile_Screen(this.USER_ID);

  @override
  State<Profile_Screen> createState() => _Profile_ScreenState(USER_ID);
}

class _Profile_ScreenState extends State<Profile_Screen> {


  String USER_ID=" ";

  _Profile_ScreenState(this.USER_ID);

  String CARD_NAVIGATOR="PERSONAL_INFORMATION";
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final ref=FirebaseDatabase.instance.ref("users");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/bg_profile.png"),
              fit: BoxFit.fitWidth,
              ),
            ),
          ),

          SingleChildScrollView(
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.only(left: 17.0,top: 25,right: 17,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap:(){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Users_Screen(USER_ID)));
                          },
                        child: Container(
                          width: 28.w,
                          height: 28.h,
                          child: Image(image: AssetImage("assets/trailing.png",),
                          color: Color(0xff272E46),
                          ),
                        ),
                      ),
                      Text("Profile",
                      style: GoogleFonts.montserrat(
                        color: Color(0xff272E46),
                        fontWeight: FontWeight.w800,
                        fontSize: 24.sp,
                        fontStyle: FontStyle.italic,
                      ),
                      ),
            
                      InkWell(
                        onTap: () {
                          String id= ref.push().key.toString();
                           ref.child(id).set({
                            "email":"${_auth.currentUser?.email}",
                            "name":"${_auth.currentUser?.displayName}",
                            "imageurl":"${_auth.currentUser?.photoURL}",
                            "id":"$id",
                          });

                        },
                        child: Container(
                          width: 28.w,
                          height: 28.h,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage("assets/edit_icon.png"),),
                          ),
                        ),
                      ),
            
                    ],
                  ),
                ),
            
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Container(
                    width: 253.47.w,
                    height: 226.71.h,
                    child: Column(
                      children: [
                        Container(
                          width: 216.w,
                          height: 216.h,
                          child: Center(
                            child: Container(
                              width: 198.w,
                              height: 198.h,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: NetworkImage('${_auth.currentUser?.photoURL}'),
                                fit: BoxFit.fill,
                                ),
                                color: Color(0xff5C4DB2),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xff6A6B7C),
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/star_profile.png"),
                      ),
                    ),
                  ),
                ),
            
                Text("${_auth.currentUser?.displayName}",
                  style: GoogleFonts.roboto(
                    color: Color(0xff272E46),
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                  ),
                ),
                Text("${_auth.currentUser?.email}",
                  style: GoogleFonts.roboto(
                    color: Color(0xff6A6B7C),
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),
                ),
            
                SizedBox(height: 30.h,),
                Padding(
                  padding: const EdgeInsets.only(left: 17.0,right: 17,),
                  child: Expanded(
                    child: Container(
                    child: Column(
                      children: [
                        Stack(
                          children: [
            
            
                            InkWell(
                              onTap: () {
                                setState(() {

                                });
                              },
                              child: Container(
                                width: 390.w,
                                height: 214.h,
                                padding: EdgeInsets.all(15),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 80.w,
                                      height: 4,
                                      decoration: BoxDecoration(
                                        color: Color(0xff868E95).withOpacity(0.2),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text("Bid",
                                        style: GoogleFonts.montserrat(
                                          color: Color(0xff272E46),
                                          fontWeight: FontWeight.w800,
                                          fontStyle: FontStyle.italic,
                                          fontSize: 20.sp,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(19),
                                  border: Border.all(
                                    width: 1.w,
                                    color: Color(0xff868E95).withOpacity(0.1),
                                  )
                                ),
                              ),
                            ),
            
            
                            Padding(
                              padding: const EdgeInsets.only(top: 60.0),
                              child: InkWell(
                                 onTap:  () {
                                   setState(() {
                                     if(CARD_NAVIGATOR=="PERSONAL_INFORMATION"){
                                       setState(() {
                                         CARD_NAVIGATOR="STATISTICS";
                                       });
                                     }else if(CARD_NAVIGATOR=="STATISTICS"){
                                       setState(() {
                                         CARD_NAVIGATOR="PERSONAL_INFORMATION";
                                       });
                                     }

                                   });
                                 },
                                child: Container(
                                  width: 390.w,
                                  height: 214.h,
                                  padding: EdgeInsets.all(15),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 80.w,
                                        height: 4,
                                        decoration: BoxDecoration(
                                          color: Color(0xff868E95).withOpacity(0.2),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: CARD_NAVIGATOR=="PERSONAL_INFORMATION"?Text("Statistics",
                                          style: GoogleFonts.montserrat(
                                            color: Color(0xff272E46),
                                            fontWeight: FontWeight.w800,
                                            fontStyle: FontStyle.italic,
                                            fontSize: 20.sp,
                                          ),
                                        ):Text("Personal Information",
                                          style: GoogleFonts.montserrat(
                                            color: Color(0xff272E46),
                                            fontWeight: FontWeight.w800,
                                            fontStyle: FontStyle.italic,
                                            fontSize: 20.sp,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(19),
                                      border: Border.all(
                                        width: 1.w,
                                        color: Color(0xff868E95).withOpacity(0.1),
                                      ),
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 120.0),
                              child: Container(
                                width: 390.w,
                                padding: EdgeInsets.only(top: 15,right: 15,left: 15),
                                child: Personal_Details_Card(),
                                decoration: BoxDecoration(
                                  color: Color(0xff272E46),
                                  borderRadius: BorderRadius.circular(19),
                                  border: Border.all(
                                    width: 1.w,
                                    color: Color(0xff868E95).withOpacity(0.1),
                                  ),
                                ),
                              ),
                            ),


            


















                          ],
                        ),
                      ],
                    ),
                  ),
                  ),
                ),
                SizedBox(height: 100,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
