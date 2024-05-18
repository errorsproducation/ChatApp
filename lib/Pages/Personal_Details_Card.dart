import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class Personal_Details_Card extends StatelessWidget {
  const Personal_Details_Card({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment:Alignment.topCenter,
          child: Container(
            width: 80.w,
            height: 4,
            decoration: BoxDecoration(
              color: Color(0xff868E95).withOpacity(0.2),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: GradientText("Personal Information",
              gradientType: GradientType.linear,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.italic,
                fontSize: 20.sp,
              ),
              colors: [Color(0xffFFF6A3),Color(0xffF96E20)],
            ),
          ),
        ),
        SizedBox(
          height:   20,
        ),

        Text("About",
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(
          height:   10,
        ),
        Text("The Inderjit Singh Bindra Stadium aka IS Bindra Stadium in Mohali is one of the most iconic international cricket venues in India. The stadium is located in Mohali, Punjab, on the outskirts of the city of Chandigarh.",
          style: GoogleFonts.roboto(
            color: Color(0xffCED9E7),
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(
          height:   05,
        ),
        Divider(
          color: Color(0xffCED9E7),
        ),

        Text("Document",
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(height: 10,),

        Row(
          children: [
            Container(
              width: 124.w,
              height: 26.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Aadhar Card",
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                    ),
                  ),
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/cancel_icon.png"),),
                    ),
                  ),


                ],
              ),
              decoration: BoxDecoration(
                color: Color(0xff565E7A),
                borderRadius: BorderRadius.circular(36),
              ),
            ),
            SizedBox(width: 05,),
            Container(
              width: 141.w,
              height: 26.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Driving Lisence",
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                    ),
                  ),
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/cancel_icon.png"),),
                    ),
                  ),


                ],
              ),
              decoration: BoxDecoration(
                color: Color(0xff565E7A),
                borderRadius: BorderRadius.circular(36),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),

        Align(
          alignment: Alignment.bottomCenter,
          child: Text("Show more",
            style: GoogleFonts.roboto(
              color: Color(0xffCED9E7),
              fontWeight: FontWeight.w600,
              fontSize: 12.sp,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),


      ],
    );
  }
}
