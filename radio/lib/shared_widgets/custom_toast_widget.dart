import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';


enum CustomToastStatus{
  downloading('assets/notification/downloading.png',),
  success('assets/notification/success.png'),
  error('assets/notification/error.png',),;
  final String imagePatch;

  const CustomToastStatus(this.imagePatch);
}

 CustomToastWidget({required BuildContext context, required CustomToastStatus status, required String title, required String subTitle}) {

   return showToastWidget(
       position: StyledToastPosition.top,
       duration : Duration(milliseconds: 1500),
       animDuration : Duration(milliseconds: 0),
       Padding(
         padding: EdgeInsets.all(2.w),
         child: Container(
           padding: EdgeInsets.all(2.w),
           decoration: BoxDecoration(
               color: Color(0xff5a5f67),
               borderRadius: BorderRadius.circular(10.0)
           ),
           child: Row(
               children:[
                 SizedBox(
                   width: 15.w,
                   child: Padding(
                     padding: EdgeInsets.all(2.w),
                     child: Image.asset(
                         status.imagePatch,
                     width: 5.h,
                       height: 5.h,
                         fit: BoxFit.fill
                     ),
                   ),
                 ),
                 SizedBox(
                   width: 2.w,
                 ),
                 SizedBox(
                   width: 70.w,
                   child: Column(
                       mainAxisSize: MainAxisSize.min,
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children:[
                         Text(
                             title,
                         style: GoogleFonts.sourceSans3(
                           fontWeight: FontWeight.w600,
                           fontSize: 15.0,
                           letterSpacing: 0.25,
                           color: Colors.white
                         ),
                         ),
                         SizedBox(
                           height: 0.3.h,
                         ),
                         Text(subTitle,
                           style: GoogleFonts.sourceSans3(
                               fontWeight: FontWeight.w400,
                               fontSize: 13.0,
                               letterSpacing: 0.4,
                               color: Color(0xffC3C7CC)
                           ),
                         ),

                       ]
                   ),
                 )
               ]
           ),
         ),
       ),

       context:context
   );


 }

