
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../home/home_page.dart';
import '../library/library.dart';
import '../providers/main_screen_provider.dart';
import '../providers/pod_cast_provider.dart';
import '../shared_widgets/custom_bottom_navigation_bar.dart';
import '../shared_widgets/mini_player.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {


  bool isPopUpOpen = false;
  String selectedItem = 'Home';
  arrowToggle(){
    isPopUpOpen = !isPopUpOpen;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff222831),
      appBar: AppBar(
        //  backgroundColor: Colors.red,
        backgroundColor: const Color(0xff222831),
        title: Row(
          children: [
            Flexible(
              child: InkWell(
                onTap: (){

                  setState(() {
                    arrowToggle();
                  });

                  showDialog(
                      context: context,
                      barrierColor: Colors.transparent,
                      //  avoidOverflow: true,
                      builder: (BuildContext context) {
                        return Stack(
                            children: [
                              Positioned(
                                top: 70.0,
                                left: 0.0,
                                right: 0.0,
                                child: Container(
                                  width: double.infinity,
                                  // height: 50,
                                  color: Color(0xff222831),
                                  child: Column(
                                    crossAxisAlignment : CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap:(){
                                          setState(() {
                                            selectedItem = 'Home';
                                          });
                                          Navigator.of(context).pop();
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(5.0),
                                          color: selectedItem == 'Home' ? Color(0xff6d727b) : Colors.transparent,
                                          width: double.infinity,
                                          child: const Text(
                                            'Home',
                                            style: TextStyle(
                                              color: Colors.white, // Set the desired text color
                                              fontSize: 16, // Set the desired font size
                                              fontWeight: FontWeight.bold,
                                              decoration: TextDecoration.none,// Set the desired font weight
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap:(){
                                          setState(() {
                                            selectedItem = 'Popular';
                                          });
                                          Navigator.of(context).pop();
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(5.0),
                                          color: selectedItem == 'Popular' ? Color(0xff6d727b) : Colors.transparent,
                                          width: double.infinity,
                                          child: const Text(
                                            'Popular',
                                            style: TextStyle(
                                              color: Colors.white, // Set the desired text color
                                              fontSize: 16, // Set the desired font size
                                              fontWeight: FontWeight.bold,
                                              decoration: TextDecoration.none,// Set the desired font weight
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ]
                        );
                      }).then((result) {
                    setState(() {
                      arrowToggle();
                    });
                    print('toggle arrow');

                  });
                },
                child: Container(
                  height: 35,
                  width: 100, // Adjust the width as needed
                  padding: const EdgeInsets.fromLTRB(4.0, 5.0, 8.0, 5.0), // Adjust the padding as needed
                  decoration: BoxDecoration(
                    color: const Color(0xff6d727b),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Row(
                    children: [
                      Text(
                        selectedItem,
                        style: GoogleFonts.sourceSans3(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.13,
                            color: Colors.white
                        ),
                      ),
                      Spacer(),
                      Icon(
                          isPopUpOpen ?   Icons.keyboard_arrow_up : Icons.keyboard_arrow_down
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),

        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context, 'LibrarySearch');


            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child:Column(
          children: [
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey.shade700,
            ),
             const SizedBox(
               height: 10.0,
             ),
             Padding(
              padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
              child:Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  Image.asset(
                    "assets/tag.png",
                    height: 30,
                    width: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Productivity',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  Container(

                    padding: EdgeInsets.fromLTRB(4.0, 2.0, 8.0, 2.0),
                    decoration: BoxDecoration(
                      color: Color(0xff6d727b),
                      borderRadius: BorderRadius.circular(50.0)
                    ),
                    child: Row(
                      children: [
                        Text(
                            '1872',
                          style: GoogleFonts.sourceSans3(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.4,
                            color: Colors.white
                          ),
                        ),
                        Icon(
                            Icons.arrow_forward_ios,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                ],
              )
            ),
            Container(
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 125,
                    enlargeCenterPage : true,
                    viewportFraction: 0.33,
                  ),
                  items: carouselImages
                      .map((item) => Container(
                   // color: Colors.green,
                    child: Center(
                      child: Container(
                        width: 125, // Set a fixed width or calculate dynamically
                        height: 125, // Set a fixed height or calculate dynamically
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child:  Image.asset(
                              item,
                              fit: BoxFit.cover, // Adjust the fit as per your preference
                            )
                        ),
                      ),
                    ),
                  ))
                      .toList(),
                )
            ),
            const SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                  'Episode 120: What Everybody Should be doing, but mostly only software people do',
                style: GoogleFonts.sourceSans3(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  letterSpacing: 0.13,
                  color:Colors.white
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(left: 20.0),

                width: 100,
                  height: 5.0,
                color: Color(0xff818790),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'On October 15, 20018, a couple was brutally murdered in a small Wisconsin town, and their 13-year-old daughter vanished without a trace.',
                style: GoogleFonts.sourceSans3(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    letterSpacing: 0.25,
                    color:Colors.white
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Icon(
                    Icons.add_circle_outline,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),



            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey.shade700,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                child:Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    Image.asset(
                      "assets/tag.png",
                      height: 30,
                      width: 30,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Productivity',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    Container(

                      padding: EdgeInsets.fromLTRB(4.0, 2.0, 8.0, 2.0),
                      decoration: BoxDecoration(
                          color: Color(0xff6d727b),
                          borderRadius: BorderRadius.circular(50.0)
                      ),
                      child: Row(
                        children: [
                          Text(
                            '1872',
                            style: GoogleFonts.sourceSans3(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.4,
                                color: Colors.white
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                  ],
                )
            ),
            Container(
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 125,
                    enlargeCenterPage : true,
                    viewportFraction: 0.33,
                  ),
                  items: carouselImages
                      .map((item) => Container(
                    // color: Colors.green,
                    child: Center(
                      child: Container(
                        width: 125, // Set a fixed width or calculate dynamically
                        height: 125, // Set a fixed height or calculate dynamically
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child:  Image.asset(
                              item,
                              fit: BoxFit.cover, // Adjust the fit as per your preference
                            )
                        ),
                      ),
                    ),
                  ))
                      .toList(),
                )
            ),
            const SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Episode 120: What Everybody Should be doing, but mostly only software people do',
                style: GoogleFonts.sourceSans3(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                    letterSpacing: 0.13,
                    color:Colors.white
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(left: 20.0),

                width: 100,
                height: 5.0,
                color: Color(0xff818790),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'On October 15, 20018, a couple was brutally murdered in a small Wisconsin town, and their 13-year-old daughter vanished without a trace.',
                style: GoogleFonts.sourceSans3(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    letterSpacing: 0.25,
                    color:Colors.white
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Icon(
                  Icons.add_circle_outline,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

          ],
        ),
      ),
        bottomNavigationBar: Column(
            mainAxisSize : MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children:[
              context.watch<PodCastProvider>().getMiniPlayerStatus() ?
              MiniPlayer() : Container(),
              const CustomBottomNavigationBar(),
            ]

        )

    );
  }
  List<String> carouselImages = [
    'assets/image 4.png',
    'assets/image 2.png',
    'assets/image 333.png',


  ];
}
