import 'package:chatapp/Pages/Chat_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Users_Screen extends StatefulWidget {


  String USER_ID=" ";

  Users_Screen(this.USER_ID);

  @override
  State<Users_Screen> createState() => _Users_ScreenState(USER_ID);
}

class _Users_ScreenState extends State<Users_Screen> {

  String USER_ID=" ";

  _Users_ScreenState(this.USER_ID);

  final users=FirebaseDatabase.instance.ref("users");
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(20),
        child: FirebaseAnimatedList(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          query: users, itemBuilder: (context, snapshot1,Animation<double> animation,int index){
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Chat_Page(snapshot1.child('id').value.toString(),snapshot1.child('name').value.toString(),USER_ID,_auth.currentUser!.displayName.toString())));
            },
            child: Container(
              width: double.infinity,
              height: 70,
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 30,
                    height: 40,
                   decoration: BoxDecoration(
                     shape: BoxShape.circle,
                     image: DecorationImage(image: NetworkImage(snapshot1.child("imageurl").value.toString())),
                   ),
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("${snapshot1.child("email").value.toString()}",
                        style: GoogleFonts.roboto(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff272E46)
                      ),
                      ),
                      SizedBox(height: 02,),
                      Text("${snapshot1.child("name").value.toString()}",
                        style: GoogleFonts.roboto(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff272E46),
                        ),
                      ),
                    ],
                  ),

                  IconButton(

                    onPressed: () {

                  }, icon: Icon(Icons.message_rounded,
                    color: Color(0xff272E46),
                  ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Color(0xff868E95).withOpacity(0.12),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        },
        ),
      ),
    );
  }
}
