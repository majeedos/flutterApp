import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:radio/shared_widgets/custom_list_tile.dart';
import '../podscast_player/pod_cast_player.dart';
import '../providers/library_provider.dart';

class ListenLaterLibraryTab extends StatelessWidget {
  const ListenLaterLibraryTab({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff222831),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                                          child: context.watch<LibraryProvider>().getLibraryListenLaterSortBy() == SortBy.recent
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

                                      context.read<LibraryProvider>().setLibraryListenLaterSortBy(sortBy: SortBy.recent);
                                      Navigator.of(context).pop();
                                    },
                                  ),

                                  InkWell(
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 10.0),
                                          child: context.watch<LibraryProvider>().getLibraryListenLaterSortBy() == SortBy.recentlyAdded
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

                                      context.read<LibraryProvider>().setLibraryListenLaterSortBy(sortBy: SortBy.recentlyAdded);
                                      Navigator.of(context).pop();
                                    },
                                  ),

                                  InkWell(
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 10.0),
                                          child: context.watch<LibraryProvider>().getLibraryListenLaterSortBy() == SortBy.alphabetical
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

                                      context.read<LibraryProvider>().setLibraryListenLaterSortBy(sortBy: SortBy.alphabetical) ;
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
                            context.watch<LibraryProvider>().getLibraryListenLaterSortBy().value,
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
            for(int index = 0; index< context.watch<LibraryProvider>().getLibraryPodCas().length; index++)
              Padding(
                padding: EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => PodCastPlayer()));
                  },
                  child: CustomListTile(

                    titlesAlignment : Alignment.centerLeft,
                   // tailAlignment : Alignment.centerLeft,
                    leading: Image.asset(context.watch<LibraryProvider>().getLibraryPodCas().elementAt(index).entries.firstWhere((element) => element.key=='Image').value),
                    title: Text(
                      context.watch<LibraryProvider>().getLibraryPodCas().elementAt(index).entries.firstWhere((element) => element.key=='title').value,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                      letterSpacing: 0.13
                      ),
                    ),
                    subTitle: Text(
                      context.watch<LibraryProvider>().getLibraryPodCas().elementAt(index).entries.firstWhere((element) => element.key=='tail').value,
                      style: TextStyle(
                          color: Color(0xffC3C7CC),
                          fontWeight: FontWeight.w400,
                          fontSize: 13),
                    ),
                    height: 80.0,
                    gap: 10.0,
                  ),
                ),
              ),
          ],
        ),
      )
    );
  }
}
