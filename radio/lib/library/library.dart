

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:radio/providers/pod_cast_provider.dart';
import 'package:sizer/sizer.dart';
import '../shared_widgets/custom_bottom_navigation_bar.dart';
import '../shared_widgets/mini_player.dart';
import '../tabs/listen_later_library_tab.dart';
import '../tabs/podscast_library_tab.dart';
import '../tabs/shorts_search_tab.dart';

class Library extends StatefulWidget{
  const Library({super.key});




  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {

  @override
  Widget build(BuildContext context) {

    return WillPopScope(

      onWillPop: () async{

        context.read<PodCastProvider>().dismissMiniPlayer();
        return true;
      },
      child: DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Scaffold(
          backgroundColor: Color(0xff222831),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            title: Text(
              "Library",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Color(0xff222831),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: TabBar(
                  labelColor: Color(0xff00ADB5),
                  unselectedLabelColor: Colors.white,
                  indicatorColor: Color(0xff00ADB5),
                  isScrollable: true,
                  tabs: <Widget>[
                    Tab(text: "Podcasts"),
                    Tab(text: "Listen Later"),
                    Tab(text: "Shorts"),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 0.5,
                color: Colors.grey,
              ),

              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: TabBarView(
                    children: [
                      PodCastLibraryTab(),
                      ListenLaterLibraryTab(),
                      ShortsSearchTab()
                    ],
                  ),
                ),
              ),


            ],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
         // floatingActionButton: context.watch<PodCastProvider>().getMiniPlayerStatus() ? MiniPlayer() : null ,

            bottomNavigationBar: Column(
                mainAxisSize : MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children:[
                  context.watch<PodCastProvider>().getMiniPlayerStatus() ?
                  MiniPlayer() : Container(),
                  Align(
                    alignment: Alignment.bottomCenter,
                      child: const CustomBottomNavigationBar()
                  ),
                ]

            )
       //   bottomNavigationBar: const CustomBottomNavigationBar(),
        )

      ),
    );
  }
}