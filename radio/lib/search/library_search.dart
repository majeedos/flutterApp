import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../providers/main_screen_provider.dart';
import '../shared_widgets/custom_bottom_navigation_bar.dart';
import '../tabs/episodes_search_tab.dart';
import '../tabs/podscasts_search_tab.dart';
import '../tabs/shorts_search_tab.dart';



class LibrarySearch extends StatelessWidget {


  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Color(0xff222831),
          appBar:  PreferredSize(
            preferredSize:  Size.fromHeight(kToolbarHeight + kBottomNavigationBarHeight + 2.h),
            child: Column(
              children:[
                Padding(
                padding:EdgeInsets.only(top: MediaQuery.of(context).padding.top+10),
                child:  Row(
                  children: [
                    const SizedBox(
                      width: 10.0,
                    ),
                    InkWell(
                      onTap: (){
                        context.read<MainScreenProvider>().setCurrentTab(0);
                        Navigator.of(context).pushReplacementNamed('/');
                      },
                      child: Container(
                        width: 7.w,
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: 20.0,
                          color: Colors.white //Color(0xff818790),

                        ),
                      ),
                    ),
                    Container(
                      width: 70.w,
                      height: 35,
                      child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            isCollapsed: true,
                          //  counterStyle:  TextStyle(color: Colors.white),
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            fillColor: Color(0xff5A5F67),
                            suffixIcon: Icon(
                              Icons.mic,
                              color: Colors.white,
                            ),
                            hintStyle: TextStyle(color: Color(0xffC3C7CC)),
                            hintText: "placeholder"),
                      ),
                    ),
                    Container(

                      width: 20.w,
                      child: Align(
                        alignment: Alignment.center,
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Search",
                              style: GoogleFonts.sourceSans3(
                                  color: Color(0xff00ADB5),
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.13
                              ),
                            )),
                      ),
                    )
                  ],
                  //color: Color(0xff222831),
                ),
              ),
                Container(
                  child: TabBar(
                    indicatorColor: Color(0xff00ADB5),
                    unselectedLabelColor: Colors.white,
                    labelColor: Color(0xff00ADB5),
                    tabs: <Widget>[
                      Tab(
                        text: "Podcasts",
                      ),
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
                         ]
            ),

          ),

          body: TabBarView(
            children: <Widget>[
              PodcastSearchTab(),
              Padding(
                  padding: EdgeInsets.only(top: 30.0),
                  child: EpisodesSearchTab()
              ),
              Padding(
                  padding: EdgeInsets.only(top: 30.0),
                  child: ShortsSearchTab()
              ),

            ],
          ),

          bottomNavigationBar: const CustomBottomNavigationBar(),

        ),
      ),
    );
  }

}
