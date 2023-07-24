import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../creator/creator_page.dart';
import '../providers/main_screen_provider.dart';
import '../shared_widgets/custom_list_tile.dart';

class ShortsSearchTab extends StatefulWidget {
  const ShortsSearchTab({super.key});

  @override
  State<ShortsSearchTab> createState() => _ShortsSearchTabState();
}

class _ShortsSearchTabState extends State<ShortsSearchTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff222831),
      body: ListView(
        children: [
          for(int index = 0; index<10; index++)
            InkWell(
              onTap: (){
                if(ModalRoute.of(context)?.settings.name == '/'){

                //  context.read<MainScreenProvider>().setCurrentScreen(CreatorPage());

                  /*Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (builder) => const CreatorPage(),
                        settings: const RouteSettings(name: 'CreatorPage'),
                      ));*/
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

        ],
      ),
    );
  }
}







