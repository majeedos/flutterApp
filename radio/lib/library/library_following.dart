



import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:radio/shared_widgets/custom_list_tile.dart';

import '../providers/library_provider.dart';
import 'package:badges/badges.dart' as badges;

class LibraryFollowing extends StatelessWidget{
   const LibraryFollowing({super.key});



  @override
  Widget build(BuildContext context) {
   return SafeArea(
     child: Scaffold(
       backgroundColor: Color(0xff222831),
       appBar: PreferredSize(
         preferredSize: const Size.fromHeight(kToolbarHeight + kBottomNavigationBarHeight),
         child: Row(

           children: [
             Padding(
               padding: EdgeInsets.all(10.0),
               child: InkWell(
                 onTap: (){
                   Navigator.of(context).pop();
                 },
                 child: Icon(
                   Icons.arrow_back_ios,
                   size: 25.0,
                   color: Colors.white,
                 ),
               ),
             ),
             Text(
               "Following",
               style: GoogleFonts.montserrat(
                 fontWeight: FontWeight.w700,
                 fontSize: 20.0,
                 color: Colors.white
               ),
             ),
           ],

         ),

       ),
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
                                           child: context.watch<LibraryProvider>().getLibraryFollowingSortBy() == SortBy.recent
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

                                       context.read<LibraryProvider>().setLibraryFollowingSortBy(sortBy: SortBy.recent);
                                       Navigator.of(context).pop();
                                     },
                                   ),

                                   InkWell(
                                     child: Row(
                                       children: [
                                         Padding(
                                           padding: EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 10.0),
                                           child: context.watch<LibraryProvider>().getLibraryFollowingSortBy() == SortBy.recentlyAdded
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

                                       context.read<LibraryProvider>().setLibraryFollowingSortBy(sortBy: SortBy.recentlyAdded);
                                       Navigator.of(context).pop();
                                     },
                                   ),

                                   InkWell(
                                     child: Row(
                                       children: [
                                         Padding(
                                           padding: EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 10.0),
                                           child: context.watch<LibraryProvider>().getLibraryFollowingSortBy() == SortBy.alphabetical
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

                                       context.read<LibraryProvider>().setLibraryFollowingSortBy(sortBy: SortBy.alphabetical) ;
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
                             context.watch<LibraryProvider>().getLibraryFollowingSortBy().value,
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


             Align(
               alignment: Alignment.centerLeft,
               child: SingleChildScrollView(
                 child: Column(
                   children: [
                     for(int index=0; index<20; index++)
                       Padding(
                         padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                         child: CustomListTile(
                           height: 80.0,
                           gap: 15,
                           titlesAlignment : Alignment.centerLeft,
                           leading: badges.Badge(
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
                           title: Text(
                             'Conan o Brien Show',
                             style: GoogleFonts.montserrat(
                               fontWeight: FontWeight.w800,
                               fontSize: 16.0,
                               letterSpacing: 0.13,
                               color: Colors.white
                             ),
                           ),
                           subTitle: Text(
                             'Sam Morril and Mark Normand',
                             style: GoogleFonts.sourceSans3(
                                 fontWeight: FontWeight.w400,
                                 fontSize: 13.0,
                                 letterSpacing: 0.4,
                               color: Colors.white

                             ),
                           ),

                         )
                       ),
                   ],
                 ),
               ),
             )

           ],
         ),
       ),

     ),
   );
  }
  
}