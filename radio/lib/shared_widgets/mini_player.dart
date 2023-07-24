

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../providers/pod_cast_provider.dart';

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

          Navigator.pushNamed(context, 'PodCastPlayer');

        },
      child: Dismissible(
          key: const ValueKey('MiniPlayer'),
          direction : DismissDirection.down,
          onDismissed: (_){
            context.read<PodCastProvider>().dismissMiniPlayer();
          },
          child: Container(
              width: double.infinity,
              height: 16.h,
              color: Color(0xff613e3e),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 20.w,
                        padding: EdgeInsets.all(2.w),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child:  Image.asset(
                              'assets/the economist.png',
                              fit: BoxFit.scaleDown, // Adjust the fit as per your preference
                            )
                        ),
                      ),
                      Container(
                        width: 67.w,
                        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 1.w),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Atomic Networks to identify Product...',
                              style: GoogleFonts.sourceSans3(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11.sp,
                                  letterSpacing: 0.25,
                                  color: Colors.white
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              'The Product Podcast',
                              style: GoogleFonts.sourceSans3(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 9.5.sp,
                                  letterSpacing: 0.4,
                                  color: Color(0xffC3C7CC)
                              ),
                            ),

                          ],
                        ),
                      ),
                      Container(
                          width: 13.w,
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                            onTap: (){

                            },
                            child: Icon(
                              Icons.play_arrow,
                              size: 9.w,
                              color: Colors.white,
                            ),
                          )
                      ),
                    ],
                  ),
                  ProgressBar(
                    progress: Duration(minutes: 37),
                    // buffered: Duration(minutes: 30),
                    total: Duration(minutes: 90),
                    progressBarColor: Colors.white,
                    baseBarColor: Color(0xff6D727B),
                    // bufferedBarColor: Colors.white.withOpacity(0.24),
                    thumbColor: Colors.transparent,
                    barHeight: 0.7.h,
                    thumbRadius: 0.0,
                    timeLabelLocation: TimeLabelLocation.none,

                  ),
                ],
              )
          )
      ),
    );
  }
}
