import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Chat_Page extends StatefulWidget {


  String RECEVIER_ID=" ";
  String RECEVIER_NAME=" ";
  String SENDER_ID=" ";
  String SENDER_NAME=" ";


  Chat_Page(
      this.RECEVIER_ID, this.RECEVIER_NAME, this.SENDER_ID, this.SENDER_NAME);

  @override
  State<Chat_Page> createState() => _Chat_PageState(RECEVIER_ID,RECEVIER_NAME,SENDER_ID,SENDER_NAME);
}

class _Chat_PageState extends State<Chat_Page> {


  String RECEVIER_ID=" ";
  String RECEVIER_NAME=" ";
  String SENDER_ID=" ";
  String SENDER_NAME=" ";


  _Chat_PageState( this.RECEVIER_ID,this.RECEVIER_NAME, this.SENDER_ID, this.SENDER_NAME);


  String USER_NAME_KASI="kasi";
  String USER_NAME_GODWIN="godwin";
  final CHAT_TEXT_FIELD=TextEditingController();
  final ref=FirebaseDatabase.instance.reference();
  final ref_for_List=FirebaseDatabase.instance.reference();


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
                    query: ref_for_List.child("users").child(SENDER_ID).child('chat').child(RECEVIER_NAME), itemBuilder: (context, snapshot1,Animation<double> animation,int index){
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
                            snapshot1.child('chat').value.toString())==SENDER_NAME?
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

                                    SizedBox(height: 05,),
                                    Text("You ${snapshot1.child('time').value.toString()}",
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
                                  Row(
                                    children: [
                                      Text("You ${snapshot1.child('time').value.toString()}",
                                        style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                          color: Color(0xff6A6B7C),
                                        ),
                                      ),
                                      Container(
                                        width: 18.w,
                                        height: 15.h,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(image: AssetImage('assets/seen_icon.png'),),
                                        ),
                                      ),
                                    ],
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



                            print(RECEVIER_ID);
                            ref.child("users").child(RECEVIER_ID).child("chat").child(SENDER_NAME).push().set(
                                {
                                  "chat":"$SENDER_NAME: ${CHAT_TEXT_FIELD.text.toString()}",
                                  "name":"$SENDER_NAME",
                                  "time":"${DateTime.now().hour} : ${DateTime.now().minute}",
                                }
                            );
                            ref.child("users").child(SENDER_ID).child("chat").child(RECEVIER_NAME).push().set(
                                {
                                  "chat":"$SENDER_NAME: ${CHAT_TEXT_FIELD.text.toString()}",
                                  "name":"$SENDER_NAME",
                                  "time":"${DateTime.now().hour} : ${DateTime.now().minute}",
                                }
                            );

                            CHAT_TEXT_FIELD.clear();



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
  }
  String name(String name){
    String n=" ";
    n=name.substring(0,10);
    return n;
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
