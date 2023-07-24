import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/home_page_provider.dart';
import 'home_page.dart';


class TagsPage extends StatefulWidget {
  const TagsPage({super.key});

  @override
  State<TagsPage> createState() => _TagsPageState();
}

class _TagsPageState extends State<TagsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff222831),
      appBar: AppBar(
        backgroundColor: Color(0xff222831),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.keyboard_arrow_left,
              color: Colors.white,
              size: 50,
            )),


      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Image.asset(
                "assets/tag.png",
                height: 70,
                width: 70,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                context.watch<HomePageProvider>().getChoseTag(),
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0,0.0,20.0,0.0),
            child: Image.asset("assets/blue.png"),
          ),

          const SizedBox(
            height: 20,
          ),

          Container(
            //height: 500,
            child: Flexible(
              child: ListView.builder(
                  itemCount: context.watch<HomePageProvider>().getTagsContent().length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: (){

                        context.read<HomePageProvider>().setCurrentStream(currentStream: index);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (builder) =>  HomePage(),
                              settings: RouteSettings(name: '/'),
                            ));

                      },
                      child: Column(
                        children: [

                          Container(
                            width: double.infinity,
                            height: 1,
                            decoration: const BoxDecoration(
                                color: Colors.grey
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                           SizedBox(
                           // margin: EdgeInsets.only(left: 10, top: 5),
                            width: 374,
                            child: Text(
                              context.watch<HomePageProvider>().getTagsContent().elementAt(index).entries.firstWhere((element) => element.key =='Title').value,

                              style:  GoogleFonts.sourceSans3(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                letterSpacing: 0.25,

                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          ListTile(
                            leading: Image.asset(
                              context.watch<HomePageProvider>().getTagsContent().elementAt(index).entries.firstWhere((element) => element.key =='Image').value,
                              height:90 ,
                              width:90 ,
                            ),
                            title: Container(
                              child: Text(
                      context.watch<HomePageProvider>().getTagsContent().elementAt(index).entries.firstWhere((element) => element.key =='Summary').value,
                                style: GoogleFonts.sourceSans3(
                                    fontSize: 13,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  letterSpacing: 0.4
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    );
                  }),

            ),

          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            height: 1,
            decoration: const BoxDecoration(
                color: Colors.grey
            ),
          ),
        ],
      ),
    );
  }
}
