import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:radio/home/tags_page.dart';
import 'package:sizer/sizer.dart';
import '../providers/home_page_provider.dart';
import '../providers/interest_provider.dart';
import '../shared_widgets/custom_bottom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = PageController(
    initialPage: 0,
  );

  ScrollController _scrollController = ScrollController();
  bool _shouldScrollChild = true;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool isPopUpOpen = false;
  String selectedItem = 'Home';
  arrowToggle() {
    isPopUpOpen = !isPopUpOpen;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async{
        return false;
      },
      child: Scaffold(
        backgroundColor: const Color(0xff222831),
        appBar: AppBar(
          //  backgroundColor: Colors.red,
          backgroundColor: const Color(0xff222831),
          title: Row(
            children: [
              Flexible(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      arrowToggle();
                    });

                    showDialog(
                        context: context,
                        barrierColor: Colors.transparent,
                        //  avoidOverflow: true,
                        builder: (BuildContext context) {
                          return Stack(children: [
                            Positioned(
                              top: 70.0,
                              left: 0.0,
                              right: 0.0,
                              child: Container(
                                width: double.infinity,
                                // height: 50,
                                color: Color(0xff222831),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedItem = 'Home';
                                        });
                                        Navigator.of(context).pop();
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(5.0),
                                        color: selectedItem == 'Home'
                                            ? Color(0xff6d727b)
                                            : Colors.transparent,
                                        width: double.infinity,
                                        child: const Text(
                                          'Home',
                                          style: TextStyle(
                                            color: Colors
                                                .white, // Set the desired text color
                                            fontSize:
                                                16, // Set the desired font size
                                            fontWeight: FontWeight.bold,
                                            decoration: TextDecoration
                                                .none, // Set the desired font weight
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedItem = 'Popular';
                                        });
                                        Navigator.of(context).pop();
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(5.0),
                                        color: selectedItem == 'Popular'
                                            ? Color(0xff6d727b)
                                            : Colors.transparent,
                                        width: double.infinity,
                                        child: const Text(
                                          'Popular',
                                          style: TextStyle(
                                            color: Colors
                                                .white, // Set the desired text color
                                            fontSize:
                                                16, // Set the desired font size
                                            fontWeight: FontWeight.bold,
                                            decoration: TextDecoration
                                                .none, // Set the desired font weight
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ]);
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
                    padding: const EdgeInsets.fromLTRB(
                        4.0, 5.0, 8.0, 5.0), // Adjust the padding as needed
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
                              color: Colors.white),
                        ),
                        Spacer(),
                        Icon(isPopUpOpen
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down)
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
                Navigator.pushNamed(context, 'LibrarySearch');
              },
              child: Padding(
                padding: EdgeInsets.all(2.w),
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 7.w,
                ),
              ),
            ),
          ],
        ),

        body: PageView(
      controller: _controller,
      scrollDirection: Axis.vertical,
      children: [


        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              stops: [0.0107, 0.6216],
              colors: [
                Color(0xFF9F4444),
                Color(0xFF222831),
              ],
              transform: GradientRotation(167.47 * (3.1415 / 180.0)),
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 1.h,
              ),
              SizedBox(
                width: 90.w,
                child: Text(
                  context
                      .watch<HomePageProvider>()
                      .getTagsContent()
                      .elementAt(context
                      .watch<HomePageProvider>()
                      .getCurrentStream())
                      .entries
                      .firstWhere((element) => element.key == 'Title')
                      .value,
                  style: GoogleFonts.montserrat(
                      fontSize: 20.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Image.asset(
                context
                    .watch<HomePageProvider>()
                    .getTagsContent()
                    .elementAt(
                    context.watch<HomePageProvider>().getCurrentStream())
                    .entries
                    .firstWhere((element) => element.key == 'Image')
                    .value,
                width: 30.h,
                height: 25.h,
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 0.2.h),
                child: StreamBuilder<DurationState>(
                  stream: null,
                  builder: (context, snapshot) {
                    final durationState = snapshot.data;
                    final progress = durationState?.progress ?? Duration.zero;
                    final buffered = durationState?.buffered ?? Duration.zero;
                    final total = durationState?.total ?? Duration.zero;
                    return ProgressBar(
                      progress: const Duration(minutes: 20), //progress,
                      buffered: buffered,
                      total: Duration(
                          minutes: context
                              .watch<HomePageProvider>()
                              .getTagsContent()
                              .elementAt(context
                              .watch<HomePageProvider>()
                              .getCurrentStream())
                              .entries
                              .firstWhere(
                                  (element) => element.key == 'Duration')
                              .value),
                      //const Duration(minutes: 50) ,//total,
                      progressBarColor: Colors.white,
                      baseBarColor: Colors.white.withOpacity(0.24),
                      bufferedBarColor: Colors.white.withOpacity(0.24),
                      thumbColor: Colors.white,
                      barHeight: 10.0,
                      thumbRadius: 10.0,
                      timeLabelTextStyle:
                      const TextStyle(color: Colors.white),
                      onSeek: (duration) {
                        // _player.seek(duration);
                      },
                    );
                  },
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                //  margin: EdgeInsets.only(left: 5, top: 5),
                width: 370,
                // height: 68,
                child: SizedBox(
                  height: 10.h,
                  child: GestureDetector(
                    onVerticalDragUpdate: (details) {
                      if (_shouldScrollChild) {
                        _scrollController.position
                            .applyViewportDimension(details.delta.dy);
                      } else {
                        _controller.position
                            .applyViewportDimension(details.delta.dy);
                      }
                    },
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (notification) {
                        if (notification is ScrollStartNotification &&
                            notification.metrics is PageMetrics) {
                          _shouldScrollChild = true;
                        } else if (notification is ScrollStartNotification &&
                            notification.metrics is FixedScrollMetrics) {
                          _shouldScrollChild = false;
                        }
                        return false;
                      },
                      child: SingleChildScrollView(
                        controller: _scrollController,
                        child: ExpandableText(
                          context
                              .watch<HomePageProvider>()
                              .getTagsContent()
                              .elementAt(context
                              .watch<HomePageProvider>()
                              .getCurrentStream())
                              .entries
                              .firstWhere(
                                  (element) => element.key == 'Summary')
                              .value +
                              ' sfsdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sfsdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sfsdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sdfsdf  sfsdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sfsdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sfsdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sfsdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sfsdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sfsdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sfsdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sfsdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sfsdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sfsdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sfsdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sdfsdf',
                          style: GoogleFonts.sourceSans3(
                              fontSize: 11.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.25),
                          linkStyle: GoogleFonts.sourceSans3(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              letterSpacing: 0.25),
                          expandText: ' Show more',
                          collapseText: 'Show less',
                          maxLines: 3,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                //  width: MediaQuery.of(context).size.width,
                height: 5.h,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: context
                        .watch<InterestProvider>()
                        .interestsData
                        .entries
                        .length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: InkWell(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          onTap: () {
                            context.read<HomePageProvider>().setChoseTag(
                                chosenTag: context
                                    .read<InterestProvider>()
                                    .interestsData
                                    .entries
                                    .elementAt(index)
                                    .key);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => const TagsPage()));
                          },
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                            // width: 87,
                            // height: 22,
                            decoration: const BoxDecoration(
                                color: Color(0xff6D727B),
                                borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                            child: Center(
                              child: Text(
                                '#${context.watch<InterestProvider>().interestsData.entries.elementAt(index).key}',
                                style: GoogleFonts.sourceSans3(
                                    color: Colors.white,
                                    fontSize: 15,
                                    letterSpacing: 0.25,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 7.h,
              ),
              // Spacer(),
              Padding(
                padding:
                EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.7.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/like.png",
                      width: 30,
                      height: 30,
                    ),
                    Image.asset(
                      "assets/upload.png",
                      width: 30,
                      height: 30,
                    ),
                    Image.asset(
                      "assets/add.png",
                      width: 30,
                      height: 30,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.all(Radius.circular(5.0)),
                          border: Border.all(
                            color: Colors.white,
                          )),
                      child: Row(
                        children: [
                          Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.rotationY(
                                3.1415), // Flip horizontally
                            child: Icon(
                              Icons.reply_outlined,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Continue Episode',
                            style: GoogleFonts.sourceSans3(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                                letterSpacing: 0.4,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),




        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              stops: [0.0107, 0.6216],
              colors: [
                Colors.white10,
                Color(0xFF222831),
              ],
              transform: GradientRotation(167.47 * (3.1415 / 180.0)),
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 1.h,
              ),
              SizedBox(
                width: 90.w,
                child: Text(
                  context
                      .watch<HomePageProvider>()
                      .getTagsContent()
                      .elementAt(context
                      .watch<HomePageProvider>()
                      .getCurrentStream())
                      .entries
                      .firstWhere((element) => element.key == 'Title')
                      .value,
                  style: GoogleFonts.montserrat(
                      fontSize: 20.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Image.asset(
                context
                    .watch<HomePageProvider>()
                    .getTagsContent()
                    .elementAt(
                    context.watch<HomePageProvider>().getCurrentStream())
                    .entries
                    .firstWhere((element) => element.key == 'Image')
                    .value,
                width: 30.h,
                height: 25.h,
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 0.2.h),
                child: StreamBuilder<DurationState>(
                  stream: null,
                  builder: (context, snapshot) {
                    final durationState = snapshot.data;
                    final progress = durationState?.progress ?? Duration.zero;
                    final buffered = durationState?.buffered ?? Duration.zero;
                    final total = durationState?.total ?? Duration.zero;
                    return ProgressBar(
                      progress: const Duration(minutes: 20), //progress,
                      buffered: buffered,
                      total: Duration(
                          minutes: context
                              .watch<HomePageProvider>()
                              .getTagsContent()
                              .elementAt(context
                              .watch<HomePageProvider>()
                              .getCurrentStream())
                              .entries
                              .firstWhere(
                                  (element) => element.key == 'Duration')
                              .value),
                      //const Duration(minutes: 50) ,//total,
                      progressBarColor: Colors.white,
                      baseBarColor: Colors.white.withOpacity(0.24),
                      bufferedBarColor: Colors.white.withOpacity(0.24),
                      thumbColor: Colors.white,
                      barHeight: 10.0,
                      thumbRadius: 10.0,
                      timeLabelTextStyle:
                      const TextStyle(color: Colors.white),
                      onSeek: (duration) {
                        // _player.seek(duration);
                      },
                    );
                  },
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                //  margin: EdgeInsets.only(left: 5, top: 5),
                width: 370,
                // height: 68,
                child: SizedBox(
                  height: 10.h,
                  child: GestureDetector(
                    onVerticalDragUpdate: (details) {
                      if (_shouldScrollChild) {
                        _scrollController.position
                            .applyViewportDimension(details.delta.dy);
                      } else {
                        _controller.position
                            .applyViewportDimension(details.delta.dy);
                      }
                    },
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (notification) {
                        if (notification is ScrollStartNotification &&
                            notification.metrics is PageMetrics) {
                          _shouldScrollChild = true;
                        } else if (notification is ScrollStartNotification &&
                            notification.metrics is FixedScrollMetrics) {
                          _shouldScrollChild = false;
                        }
                        return false;
                      },
                      child: SingleChildScrollView(
                        controller: _scrollController,
                        child: ExpandableText(
                          context
                              .watch<HomePageProvider>()
                              .getTagsContent()
                              .elementAt(context
                              .watch<HomePageProvider>()
                              .getCurrentStream())
                              .entries
                              .firstWhere(
                                  (element) => element.key == 'Summary')
                              .value +
                              ' sfsdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sfsdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sfsdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sdfsdf  sfsdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sfsdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sfsdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sfsdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sfsdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sfsdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sfsdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sfsdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sfsdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sfsdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sfsdfsdf sdfsdf sdfsdf sdfsdf sdfsdf sdfsdf',
                          style: GoogleFonts.sourceSans3(
                              fontSize: 11.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.25),
                          linkStyle: GoogleFonts.sourceSans3(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              letterSpacing: 0.25),
                          expandText: ' Show more',
                          collapseText: 'Show less',
                          maxLines: 3,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                //  width: MediaQuery.of(context).size.width,
                height: 5.h,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: context
                        .watch<InterestProvider>()
                        .interestsData
                        .entries
                        .length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: InkWell(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          onTap: () {
                            context.read<HomePageProvider>().setChoseTag(
                                chosenTag: context
                                    .read<InterestProvider>()
                                    .interestsData
                                    .entries
                                    .elementAt(index)
                                    .key);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => const TagsPage()));
                          },
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                            // width: 87,
                            // height: 22,
                            decoration: const BoxDecoration(
                                color: Color(0xff6D727B),
                                borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                            child: Center(
                              child: Text(
                                '#${context.watch<InterestProvider>().interestsData.entries.elementAt(index).key}',
                                style: GoogleFonts.sourceSans3(
                                    color: Colors.white,
                                    fontSize: 15,
                                    letterSpacing: 0.25,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 7.h,
              ),
              // Spacer(),
              Padding(
                padding:
                EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.7.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/like.png",
                      width: 30,
                      height: 30,
                    ),
                    Image.asset(
                      "assets/upload.png",
                      width: 30,
                      height: 30,
                    ),
                    Image.asset(
                      "assets/add.png",
                      width: 30,
                      height: 30,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.all(Radius.circular(5.0)),
                          border: Border.all(
                            color: Colors.white,
                          )),
                      child: Row(
                        children: [
                          Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.rotationY(
                                3.1415), // Flip horizontally
                            child: Icon(
                              Icons.reply_outlined,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Continue Episode',
                            style: GoogleFonts.sourceSans3(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                                letterSpacing: 0.4,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]
        ),

        bottomNavigationBar: CustomBottomNavigationBar(),
      ),
    );

  }
}

class DurationState {
  const DurationState(
      {required this.progress, required this.buffered, required this.total});
  final Duration progress;
  final Duration buffered;
  final Duration total;
}
