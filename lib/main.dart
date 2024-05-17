import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

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

class MyApp extends StatelessWidget {
   MyApp({super.key});

  final chatref=FirebaseDatabase.instance.ref("chats");
  String USER_NAME_KASI="kasi";
  String USER_NAME_GODWIN="godwin";
  final CHAT_TEXT_FIELD=TextEditingController();

  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize:  const Size(375, 812),
      builder: (context, child) {
        return Scaffold(
          body: Stack(
            children: [

              Container(
                width: double.infinity,
                height: double.infinity,

                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/bg_chat.png"),
                    fit: BoxFit.fill,),
                ),
              ),




              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 17.0,top: 25,right: 17,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap:(){

                          },
                          child: Container(
                            width: 28.w,
                            height: 28.h,
                            child: Image(image: AssetImage("assets/back_arrow.png",),
                              color: Color(0xff272E46),
                            ),
                          ),
                        ),
                        Text("Support Chat",
                          style: GoogleFonts.montserrat(
                            color: Color(0xff272E46),
                            fontWeight: FontWeight.w800,
                            fontSize: 24.sp,
                            fontStyle: FontStyle.italic,
                          ),
                        ),

                        Container(
                          width: 28.w,
                          height: 28.h,
                        ),

                      ],
                    ),
                  ),


                  Expanded(
                    child: Container(
                      width: 390.w,
                      padding: EdgeInsets.all(20),
                      child: FirebaseAnimatedList(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        query: chatref, itemBuilder: (context, snapshot1,Animation<double> animation,int index){
                    
                        int i=index+1;
                    
                        return InkWell(
                          onTap: () {
                            print(getStringAftersemicolon(snapshot1.child('chat').value.toString()));
                          },
                          child: Container(
                            width: 390.w,
                            //color: Colors.blue,
                            margin: EdgeInsets.all(2),
                            child: getStringAftersemicolon(
                                snapshot1.child('chat').value.toString())==USER_NAME_GODWIN?
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(

                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                      Row(
                                        children: [
                                          Container(
                                            child: Text(getStringAftercolon(snapshot1.child('chat').value.toString()),
                                              style: GoogleFonts.roboto(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white,
                                              ),
                                            ),
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Color(0xff3D55AB),
                                            ),
                                          ),

                                          SizedBox(width: 10,),
                                          Container(
                                            width: 49.w,
                                            height: 49.h,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xff5C4DB2),
                                            ),
                                          ),
                                        ],
                                      ) ,

                                        SizedBox(height: 10,),
                                        Text("You 09:59",
                                        style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                          color: Color(0xff6A6B7C),
                                        ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                              ],
                            ):
                            Container(
                              width: 390.w,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 49.w,
                                    height: 49.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff5C4DB2),
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        child: Text(getStringAftercolon(snapshot1.child('chat').value.toString()),
                                        maxLines: 5,
                                        style: GoogleFonts.roboto(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff272E46)
                                        ),
                                        ),
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Color(0xff868E95).withOpacity(0.12),
                                        ),
                                      ) ,

                                      SizedBox(height: 10,),
                                      Text("You 09:58",
                                        style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                          color: Color(0xff6A6B7C),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,right: 20,bottom: 20),
                    child: Container(
                      width: 390.w,
                      height: 62.h,

                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [


                            Container(
                              padding: EdgeInsets.only(right: 10,left: 10,),
                              width: 220.w,
                              child: TextFormField(
                                controller: CHAT_TEXT_FIELD,
                                decoration: InputDecoration(
                                  hintText: "Write Something...",
                                  hintStyle: GoogleFonts.roboto(
                                    color: Color(0xff272E46),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Container(
                              width: 33.w,
                              height: 33.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff868E95).withOpacity(0.2),
                              ),
                              child: Center(
                                child: Image(image: AssetImage("assets/mic_icon.png",),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: ()  {

                                String message=CHAT_TEXT_FIELD.text.toString();
                                chatref.push().set({
                                  "chat":"$USER_NAME_GODWIN: $message",
                                });
                              },
                              child: Container(
                                width: 36.w,
                                height: 36.h,
                                decoration: BoxDecoration(),
                                child: Center(
                                  child: Image(image: AssetImage("assets/send_icon.png",),
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Color(0xff272E46),
                          )
                      ),
                    ),
                  ),


                ],
              ),
            ],
          ),
        );
      },
    );


  }
   String getStringAftercolon(String input) {
     // Find the index of the "#" character
     int hashIndex = input.indexOf(":");

     // Check if the "#" character is found
     if (hashIndex != -1) {
       // Extract the substring after the "#" character
       String result = input.substring(hashIndex + 1).trim();
       return result;
     } else {
       // Return an empty string or handle the case where "#" is not found
       return "";
     }
   }
   String getStringAftersemicolon(String input) {
    String s=input.split(':').first;
    return s;
   }
}


