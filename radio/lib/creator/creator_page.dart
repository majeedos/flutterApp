
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../shared_widgets/custom_list_tile.dart';
import '../shared_widgets/custom_bottom_navigation_bar.dart';

class CreatorPage extends StatefulWidget {
  const CreatorPage({super.key});

  @override
  State<CreatorPage> createState() => _CreatorPageState();
}

class _CreatorPageState extends State<CreatorPage> {
  bool follow = false;
  String sortBy = 'Recent';

  int currentTabView = 0;

  @override
  Widget build(BuildContext context) {

    List<Widget> shortsSearchTab = [];
    for (int index = 0; index < 10; index++) {
      shortsSearchTab.add(
        InkWell(
          onTap: (){
            if(ModalRoute.of(context)?.settings.name == '/'){

              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (builder) => const CreatorPage(),
                    settings: const RouteSettings(name: 'CreatorPage'),
                  ));
            }
          },
          child: Column(
            children: [

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Short Title: Elon Musk on Spacex',
                    maxLines: 1,
                    style: GoogleFonts.sourceSans3(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      letterSpacing: 0.25,
                      textStyle: TextStyle(overflow: TextOverflow.ellipsis),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: CustomListTile(
                  height: 82,
                  leading: Image.asset(
                    "assets/image 3.png",
                  ),
                  subTitle: Text(
                    'On October 15, 20018, a couple was brutally murdered in a small Wisconsin town, and their 13-year-old daughter vanished without a trace. For 88 days, the search for',
                    maxLines: 4,
                    style: GoogleFonts.sourceSans3(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      letterSpacing: 0.4,
                      textStyle: TextStyle(overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  gap: 10.0,
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                height: 1.0,
                width: double.infinity,
                color: Color(0xff818790),
              ),
              SizedBox(
                height: 30.0,
              )
            ],
          ),
        ),
      );
    }

    List<Widget> episodesSearchTab = [];

    for (int index = 0; index < 10; index++){
      episodesSearchTab.add(
      Padding(
        padding: EdgeInsets.fromLTRB( 10.0, 0, 10.0, 25.0),
        child: InkWell(
          onTap: (){
            print('current route: ${ModalRoute.of(context)?.settings.arguments}');

            if(ModalRoute.of(context)?.settings.name == '/'){

              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (builder) => const CreatorPage(),
                    settings: const RouteSettings(name: 'CreatorPage'),
                  ));
            }


          },
          child: CustomListTile(
            height: 100.0,
            gap: 10.0,
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/image 3.png',
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              'John Mulaney Returns',
              style: GoogleFonts.sourceSans3(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  letterSpacing: 0.25),
            ),
            subTitle: Text(
              'Pit Bull have a dark reputation. And some people say the science backs this but I am more text more text more text more text',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.sourceSans3(
                  color: Color(0xffafb3b8),
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  letterSpacing: 0.4),
            ),
            tail: Text(
              'March 23 • 1 hr, 9 min',
              style: GoogleFonts.sourceSans3(
                  color: Color(0xffc3c7cc),
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  letterSpacing: 0.4),
            ),

          ),
        ),
      )
      );
    }


    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xff222831),
        appBar: AppBar(
          backgroundColor: Color(0xff222831),
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.arrow_back_ios,
                size: 30.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: ListView(
          shrinkWrap: true,
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: CustomListTile(
                      height: 120.0,
                      gap: 16.0,
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/image 3.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        'Conan O Brien Show',
                        style: GoogleFonts.sourceSans3(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                            letterSpacing: 0.13),
                      ),
                      subTitle: Text(
                        'Sam Morril and Mark Normand',
                        style: GoogleFonts.sourceSans3(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            letterSpacing: 0.4),
                      ),
                      tail: Text(
                        '178 padcasts • 168k followers',
                        style: GoogleFonts.sourceSans3(
                            color: Color(0xffc3c7cc),
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            letterSpacing: 0.4),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                    child: ExpandableText(
                      'After 25 years at the late Night desk, Conan realized that the only people at his holiday part are the more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text more text ',
                      maxLines: 2,
                      expandText: 'Show more',
                      collapseText: 'Show less',
                      style: GoogleFonts.sourceSans3(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          letterSpacing: 0.13),
                      linkStyle: GoogleFonts.sourceSans3(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          letterSpacing: 0.25),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {

                          print('current route: ${ModalRoute.of(context)?.settings.name}');


                          setState(() {
                            follow = !follow;
                          });
                        },
                        child: Text(follow ? "Unfolow" : "Folow",
                            style: GoogleFonts.sourceSans3(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                letterSpacing: 0.13)),
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                            follow ? Color(0xff222831) : Color(0xff00ADB5),
                            fixedSize: Size(300, 50),
                            side: BorderSide(
                                color: follow ? Colors.white : Colors.transparent)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(25.0, 15.0, 182.0, 0.0),
                    child:  TabBar(
                      indicatorColor: Color(0xff00ADB5),
                      unselectedLabelColor: Colors.white,
                      labelColor: Color(0xff00ADB5),
                      onTap: (tabNumber){
                        setState(() {
                          currentTabView = tabNumber;
                        });
                        print((tabNumber));
                      },
                      tabs: <Widget>[
                        Tab(
                          text: "Episodes",
                        ),
                        Tab(
                          text: "Shorts",
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 0.2,
                    color: Colors.grey,
                  ),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 15.0, 0.0, 10.0),
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
                                                child: sortBy == 'Recent'
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
                                            setState(() {
                                              sortBy = 'Recent';
                                            });
                                            Navigator.of(context).pop();
                                          },
                                        ),

                                        InkWell(
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 10.0),
                                                child: sortBy == 'Recently Added'
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
                                            setState(() {
                                              sortBy = 'Recently Added';
                                            });
                                            Navigator.of(context).pop();
                                          },
                                        ),

                                        InkWell(
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 10.0),
                                                child: sortBy == 'Alphabetical'
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
                                            setState(() {
                                              sortBy = 'Alphabetical';
                                            });
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
                                  sortBy,
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
                  SizedBox(
                    //width: 100,
                    height: 30,
                    //color:  Colors.yellow,
                  ),



                ],
              ),

              currentTabView == 0
              ? Column(
                children: [
                  for(int index=0; index < episodesSearchTab.length; index++)
                    episodesSearchTab[index],
                ],
              )
             : Column(
                children: [
                  for(int index=0; index < shortsSearchTab.length; index++)
                    shortsSearchTab[index],
                ],
              )


            ]
        ),

        bottomNavigationBar: const CustomBottomNavigationBar(),


      ),
    );
  }
}


