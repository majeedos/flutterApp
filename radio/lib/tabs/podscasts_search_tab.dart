import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:radio/creator/creator_page.dart';
import 'package:sizer/sizer.dart';

import '../providers/main_screen_provider.dart';
import '../providers/search_provider.dart';

class PodcastSearchTab extends StatelessWidget {
  const PodcastSearchTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filteredProdCasts = context.watch<SearchProvider>().filteredProdCasts;
    return Scaffold(
      backgroundColor: const Color(0xff222831),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Wrap(

                  direction : Axis.horizontal,
                    spacing : 10.w,
                  runSpacing: 5.w,
                  children: [
                    for (int index = 0;index <context.watch<SearchProvider>().filteredProdCasts.length; index++)
                      Column(

                        mainAxisSize : MainAxisSize.max,
                        children: [
                          InkWell(
                            onTap: (){
                              print('current route: ${ModalRoute.of(context)?.settings.name}');

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (builder) => const CreatorPage(),
                                    settings: RouteSettings(name: 'CreatorPage'),
                                  ));

                            },
                            child: Container(
                         //   height: 250,
                              width: 35.w,
                             // color: Colors.amber,
                              child: Column(
                                crossAxisAlignment : CrossAxisAlignment.start,
                                children: [
                              ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                filteredProdCasts[index]['image']!,
                                fit: BoxFit.cover,
                                height: 35.w,
                                width: 35.w,
                              ),
                              ),

                                  Padding(
                                    padding: EdgeInsets.only(left: 10.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        filteredProdCasts[index]['title']!,
                                        style: GoogleFonts.sourceSans3(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13,
                                            letterSpacing: 0.4),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                filteredProdCasts[index]['subTitle']!,
                style: GoogleFonts.sourceSans3(
                    color: Color(0xff818790),
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    letterSpacing: 0.4),
              ),
            ),)

                                ],
                              ),
                            ),
                          )

                        ],
                      )
                  ],
                ),
              ),
            )

            ),
      ),
    );
  }
}
