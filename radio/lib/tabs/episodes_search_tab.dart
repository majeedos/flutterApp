import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../creator/creator_page.dart';
import '../providers/main_screen_provider.dart';
import '../shared_widgets/custom_list_tile.dart';

class EpisodesSearchTab extends StatefulWidget {
  const EpisodesSearchTab({super.key});

  @override
  State<EpisodesSearchTab> createState() => _EpisodesSearchTabState();
}

class _EpisodesSearchTabState extends State<EpisodesSearchTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff222831),
      body: ListView(
        physics: PageScrollPhysics(),
        children: [
          for(int index = 0; index< 10; index++)
            Padding(
              padding: EdgeInsets.fromLTRB( 10.0, 0, 10.0, 25.0),
              child: InkWell(
                onTap: (){
                  print('current route: ${ModalRoute.of(context)?.settings.arguments}');

    if(ModalRoute.of(context)?.settings.name == '/'){

     // context.read<MainScreenProvider>().setCurrentScreen(CreatorPage());

      /*Navigator.push(
          context,
          MaterialPageRoute(
            builder: (builder) => const CreatorPage(),
            settings: const RouteSettings(name: 'CreatorPage'),
          ));*/
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
            ),

        ],

      ),
    );
  }
}
