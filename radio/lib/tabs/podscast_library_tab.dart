import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:radio/providers/library_provider.dart';
import 'package:radio/shared_widgets/custom_list_tile.dart';

import '../library/library_following.dart';
import '../podscast_player/pod_cast_player.dart';
import 'package:badges/badges.dart' as badges;

import '../shared_widgets/custom_toast_widget.dart';



class PodCastLibraryTab extends StatelessWidget {
  const PodCastLibraryTab({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff222831),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Expanded(
                  flex: 9,
                    child: Container(
                   //   color: Colors.blueAccent,
                     // height: 30.0,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for(int index=0; index<20; index++)
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                                child: InkWell(
                                  onTap: (){
                                    int random = faker.randomGenerator.integer(3) ;

                                    switch(random) {
                                      case 0 :
                                        CustomToastWidget(context: context, status: CustomToastStatus.downloading, title: 'Downloading', subTitle: 'Joe Rogan Episode #1 is downloading');
                                        break;
                                      case 1 :
                                        CustomToastWidget(context: context, status: CustomToastStatus.success, title: 'Success', subTitle: 'Joe Rogan Episode #1 is done downloading');
                                        break;
                                      case 2 :
                                        CustomToastWidget(context: context, status: CustomToastStatus.error, title: 'Error 403', subTitle: 'Make sure your request is good');
                                        break;

                                    }


                                  },
                                  child: badges.Badge(
                                    position: badges.BadgePosition.topEnd(top: -10, end: -10),

                                    badgeStyle: badges.BadgeStyle(
                                      shape: badges.BadgeShape.circle,
                                      badgeColor: Color(0xff00adb5),
                                      padding: EdgeInsets.all(3.0),
                                      borderRadius: BorderRadius.circular(4),
                                      // borderSide: BorderSide(color: Colors.white, width: 2),
                                    ),

                                    badgeContent: Text(
                                      '150',
                                      style: GoogleFonts.sourceSans3(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13.0,
                                        letterSpacing: 0.4,
                                        color: Colors.white
                                      ),

                                    ),
                                    child: Image.asset(
                                      "assets/image 3.png",
                                      height: 80,
                                      width: 80,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        )
                      ),
                    )
                ),
                Expanded(
                    flex: 1,
                    child: Center(
                      child: InkWell(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => LibraryFollowing()));

                        },
                        child: Text(
                          'All',
                          style: GoogleFonts.sourceSans3(
                            fontWeight: FontWeight.w600,
                            fontSize: 17.0,
                            letterSpacing: 0.13,
                            color: Color(0xff00adb5)
                          ),
                        ),
                      ),
                    )
                ),

              ],

            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.fromLTRB(10.0, 15.0, 0.0, 20.0),
              child: InkWell(
                onTap: (){
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      /*shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20.0))
                            ),*/
                      builder: (BuildContext context){

                        return SingleChildScrollView(
                          child: Container(
                            // width: 100,
                            // height: 300,

                            decoration: BoxDecoration(
                                color: Color(0xff5a5f67),
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: (EdgeInsets.fromLTRB(15.0, 20.0, 0.0, 10.0)),
                                  child: Text(
                                    'Sort By',
                                    style: GoogleFonts.montserrat(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 16,
                                        letterSpacing: 0.13),
                                  ),
                                ),

                                InkWell(

                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 10.0),
                                        child: context.watch<LibraryProvider>().getLibraryPodCastSortBy() == SortBy.recent
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
                                          'Recent',
                                          style: GoogleFonts.sourceSans3(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  onTap: (){

                                    context.read<LibraryProvider>().setLibraryPodCastSortBy(sortBy: SortBy.recent);
                                    Navigator.of(context).pop();
                                  },
                                ),

                                InkWell(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 10.0),
                                        child: context.watch<LibraryProvider>().getLibraryPodCastSortBy() == SortBy.recentlyAdded
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
                                          'Recently Added',
                                          style: GoogleFonts.sourceSans3(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  onTap: (){

                                    context.read<LibraryProvider>().setLibraryPodCastSortBy(sortBy: SortBy.recentlyAdded);
                                    Navigator.of(context).pop();
                                  },
                                ),

                                InkWell(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 10.0),
                                        child: context.watch<LibraryProvider>().getLibraryPodCastSortBy() == SortBy.alphabetical
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
                                          'Alphabetical',
                                          style: GoogleFonts.sourceSans3(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  onTap: (){

                                    context.read<LibraryProvider>().setLibraryPodCastSortBy(sortBy: SortBy.alphabetical) ;
                                    Navigator.of(context).pop();
                                  },
                                ),

                              ],
                            ),
                          ),
                        );

                      });
                },
                child: Row(
                    mainAxisSize : MainAxisSize.min,
                    children: [
                      Text(
                          context.watch<LibraryProvider>().getLibraryPodCastSortBy().value,
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                              letterSpacing: 0.13)),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                    ]),
              ),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
                child: Column(
                        children: [
                          for(int index=0; index<context.watch<LibraryProvider>().getLibraryPodCas().length; index++)
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, 'PodCastPlayer') ;
                                },
                                child: CustomListTile(

                                  leading: Image.asset(
                                      context.watch<LibraryProvider>().getLibraryPodCas().elementAt(index).entries.firstWhere((element) => element.key=='Image').value

                                  ), // Image.asset("assets/image 3.png"),
                                  title: Text(
                                    context.watch<LibraryProvider>().getLibraryPodCas().elementAt(index).entries.firstWhere((element) => element.key=='title').value,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17),
                                  ),
                                  subTitle: Text(
                                    context.watch<LibraryProvider>().getLibraryPodCas().elementAt(index).entries.firstWhere((element) => element.key=='tail').value,
                                    style: TextStyle(
                                        color: Color(0xffC3C7CC),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13),
                                  ),
                                  gap: 12.0,
                                  height: 80,
                                ),
                              ),
                            ),
                        ],
                ),

              )
          ),



        ],
      ),
    );
  }
}
