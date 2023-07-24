import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:radio/providers/pod_cast_provider.dart';
import 'package:sizer/sizer.dart';

class PodCastPlayer extends StatefulWidget {
  const PodCastPlayer({super.key});

  @override
  State<PodCastPlayer> createState() => _PodCastPlayerState();
}

class _PodCastPlayerState extends State<PodCastPlayer> {
  @override
  Widget build(BuildContext context) {
    int valueHolder = 20;

    return WillPopScope(
      onWillPop: () async{
        context.read<PodCastProvider>().dismissMiniPlayer();
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xff222831),
          appBar: PreferredSize(

            preferredSize: Size.fromHeight(kToolbarHeight + kBottomNavigationBarHeight),
            child: Row(
              children: [
                Padding(
            padding: EdgeInsets.all(10.0),
            child: InkWell(
              onTap: (){
                context.read<PodCastProvider>().showMiniPlayer();
                Navigator.of(context).pop();
              },
              child: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  size: 25.0,
                color: Colors.white,
              ),
            ),
        )
            ],
          ),

          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 96.0),
                  child: Center(
                      child: Image.asset(
                    "assets/lo.png",
                    width: 200,
                    height: 200,
                  )),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 0.0),
                  child: SizedBox(
                    width: 350,
                    child: Text(
                      "Cal Newport: Lifestyle Design, Slow Productivity, and Contrarian Writing",
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700
                      ),

                    ),
                  ),


                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                  child: SizedBox(
                    width: 350,
                    child: Text(
                      "2y ago",
                      style: GoogleFonts.sourceSans3(
                          color: Color(0xffc3c7cc),
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600
                      ),

                    ),
                  ),


                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/ThumbUp.png",
                        height: 30,
                        width: 30,
                      ),
                      Image.asset(
                        "assets/ThumbDown.png",
                        height: 30,
                        width: 30,
                      ),
                      Image.asset(
                        "assets/share.png",
                        height: 30,
                        width: 30,
                      ),
                      Image.asset(
                        "assets/AddToWatchLater.png",
                        height: 30,
                        width: 30,
                      ),
                    ],
                  ),
                ),


                /*Divider(
                  color: Color(0xff474C53),
                ),*/

                Container(
                  color: Color(0xff474C53),
                  width: double.infinity,
                  height: 1.0,
                ),

                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 5.w),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 50.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "The Daily",
                                  style: GoogleFonts.montserrat(
                                      color: Color(0xffC3C7CC),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800
                                  ),
                                ),
                                Text(
                                  "2.7M Followers",
                                  style: GoogleFonts.sourceSans3(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                      color: Color(0xff818790),
                                    letterSpacing: 0.4
                                  ),
                                ),

                              ],
                            )
                        ),
                        SizedBox(
                            width: 40.w,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xff00ADB5),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    padding: EdgeInsets.fromLTRB(8.0, 5.0, 8.0, 5.0)
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    "Follow",
                                    style: GoogleFonts.sourceSans3(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15.0,
                                      color: Colors.white,
                                      letterSpacing: 0.25
                                    ),
                                  )),
                            ),
                        ),
                      ],
                    ),
                  ),

               Container(
                 color: Color(0xff474C53),
                 width: double.infinity,
                 height: 1.0,
               ),
               /* Divider(
                  color: Color(0xff474C53),
                ),*/


                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  child: Container(
                    width: 352,
                   // height: 240,
                    child: ExpandableText(
                      maxLines: 9,
                      expandText: 'Show more',
                      collapseText: ' Show less',
                      "After 25 years at the Late Night desk, Conan realized that the only people at his holiday party are the men and women who work for him. Over the years and despite thousands of interviews, Conan has never made a real and lasting friendship with any of his celebrity guests. So, he started a podcast to do just that. Deeper, unboundedly playful, and free from FCC regulations more text  more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text",
                      style: GoogleFonts.sourceSans3(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        letterSpacing: 0.25
                      ),
                      linkStyle: GoogleFonts.sourceSans3(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          letterSpacing: 0.25),
                    ),
                  ),
                ),




              ],
            ),
          ),
          bottomNavigationBar: Column(
              mainAxisAlignment : MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              ProgressBar(
                progress: Duration(minutes: 20),
                buffered: Duration(minutes: 50),
                total: Duration(minutes: 100),
                progressBarColor: Color(0xff00ADB5),
                baseBarColor: Color(0xffa4a4a4),
                bufferedBarColor: Color(0xffa4a4a4),
                thumbColor: Color(0xff00ADB5),
                timeLabelType: TimeLabelType.totalTime,
                timeLabelLocation: TimeLabelLocation.below,
                timeLabelTextStyle: GoogleFonts.sourceSans3(
                    fontWeight: FontWeight.w600,
                    fontSize: 13.0,
                    letterSpacing: 0.4,
                    color: Colors.white
                ),
                onSeek: (duration) {
                  print('User selected a new time: $duration');
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  InkWell(
                      onTap: () {
                        showModalBottomSheet<void>(
                          context: context,
                          backgroundColor: Colors.transparent,
                          builder: (BuildContext context) {
                            return SingleChildScrollView(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xff5A5F67),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20))),
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      for(int index =0; index< PlaybackSpeed.values.length; index++)
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: InkWell(
                                            onTap: (){
                                              context.read<PodCastProvider>().setCurrentPlayBackSpeed(playbackSpeed: PlaybackSpeed.values.elementAt(index));
                                              Navigator.of(context).pop();
                                            },
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 10.0),
                                                  child: PlaybackSpeed.values.elementAt(index) == context.watch<PodCastProvider>().getCurrentPlayBackSpeed()
                                                      ?  Icon(
                                                    Icons.done,
                                                    size: 30.0,
                                                    color: Colors.white,

                                                  )
                                                      : Container(width: 30.0, height: 30.0,),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 10.0),
                                                  child: Text(
                                                    PlaybackSpeed.values.elementAt(index).value,
                                                    style: GoogleFonts.sourceSans3(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 17,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),

                                      InkWell(
                                        onTap: (){
                                          Navigator.of(context).pop();
                                        },
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 10.0),
                                              child:  Icon(
                                                Icons.clear,
                                                size: 30.0,
                                                color: Colors.white,

                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 10.0),
                                              child: Text(
                                                'Cancel',
                                                style: GoogleFonts.sourceSans3(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 17,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        width: 4.h,
                        height: 4.h,
                        padding: EdgeInsets.all(1.0),
                        decoration: BoxDecoration(
                            shape : BoxShape.circle,
                            border: Border.all(
                                width: 0.2.h,
                                color: Colors.white
                            )
                        ),
                        child: Center(
                          child: Text(
                            context.watch<PodCastProvider>().getCurrentPlayBackSpeed() == PlaybackSpeed.normal ? '1x' :  context.watch<PodCastProvider>().getCurrentPlayBackSpeed().value,
                            style: TextStyle(
                                fontSize:
                                1.h,
                                color: Colors.white,
                                fontWeight: FontWeight.w900
                            ),
                          ),
                        ),

                  ),
                  ),


                  Image.asset(
                    "assets/Replay 10.png",
                    width: 8.w,
                    height: 8.w,
                    fit: BoxFit.cover,
                  ),
                  InkWell(
                    onTap: (){
                      context.read<PodCastProvider>().togglePlaying();
                      print(context.read<PodCastProvider>().getPlayingStatus());

                    },
                    child: Image.asset(
                      context.watch<PodCastProvider>().getPlayingStatus() ? "assets/pause.png" : "assets/Play circle filled.png",
                      width: 14.w,
                      height: 14.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Image.asset(
                    "assets/Forward 10.png",
                    width: 8.w,
                    height: 8.w,
                    fit: BoxFit.cover,
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet<void>(
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (BuildContext context) {
                          return SingleChildScrollView(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xff5A5F67),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20))),
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Sleep Timer",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 16),
                                      ),
                                    ),



                                    for(int index=0; index< SleepTimer.values.length; index++)
                                    InkWell(
                                      onTap: (){
                                        context.read<PodCastProvider>().setCurrentSleepTimer(sleepTimer: SleepTimer.values.elementAt(index));
                                        Navigator.of(context).pop();
                                      },
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 10.0),
                                            child: SleepTimer.values.elementAt(index) == context.watch<PodCastProvider>().getCurrentSleepTimer()
                                            ?Icon(
                                              Icons.done,
                                              size: 30.0,
                                              color: Colors.white,

                                            )
                                            : Container(width: 30.0, height: 30.0,),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 10.0),
                                            child: Text(
                                              SleepTimer.values.elementAt(index).value,
                                              style: GoogleFonts.sourceSans3(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 17,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),












                                    InkWell(
                                      onTap: (){
                                        Navigator.of(context).pop();
                                      },
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 10.0),
                                            child:  Icon(
                                              Icons.clear,
                                              size: 30.0,
                                              color: Colors.white,

                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 10.0),
                                            child: Text(
                                              'Cancel',
                                              style: GoogleFonts.sourceSans3(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 17,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Image.asset(
                      "assets/Timer.png",
                      height: 32,
                      width: 32,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ],
          ),


        ),
      ),
    );
  }
}
