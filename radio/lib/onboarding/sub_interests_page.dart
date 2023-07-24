import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:radio/onboarding/sub_interest_chip.dart';
import '../../providers/interest_provider.dart';
import '../home/home_page.dart';




class SubInterestsPage extends StatelessWidget {
  const SubInterestsPage({super.key});

  @override
  Widget build(BuildContext context) {


   // final subInterestDataList = context.watch<MainProvider>().getSubInterestDataByTitle(chosenInterestData).entries.toList();
    var subInterestDataList = [];



    for (var chosenInterestData in context.watch<InterestProvider>().getAllChosenInterestData()  ){

      subInterestDataList.add(context.watch<InterestProvider>().getInterestDataByTitle(chosenInterestData))   ;
    }

    final halfLength = (subInterestDataList.length / 2).ceil();
    final firstHalf = subInterestDataList.sublist(0, halfLength);
    final secondHalf = subInterestDataList.sublist(halfLength);



    Map<String, List<MapEntry<String, String>>> allSubInterestData = {};

    for (var chosenInterestData in context.watch<InterestProvider>().getAllChosenInterestData()) {
      var subInterestDataList = context
          .watch<InterestProvider>()
          .getSubInterestDataByTitle(chosenInterestData)
          .entries
          .map((entry) => MapEntry(entry.key, entry.value))
          .toList();

      allSubInterestData[chosenInterestData] = subInterestDataList;
    }


    print('//////////////////////////////');
   // print(someThing_0);
  //  print(someThing_1);
    print('***************************************');
    print(allSubInterestData);

    return Scaffold(
      backgroundColor: const Color(0xff222831),
      extendBody: false,
      appBar: AppBar(
        backgroundColor: const Color(0xff222831),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
              onPressed: (){
                context.read<InterestProvider>().clearAllChosenInterests();
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => HomePage()));
              },
              child: const Text('Skip', style: TextStyle(color:
              Colors.white, fontWeight: FontWeight.w700),)
          )

        ],

      ),
      body: SafeArea(

          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisSize : MainAxisSize.min,
                children: [
                  Text(
                    'Choose your interests',
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 319,
                    child: Text(
                      'Personalize your experience by picking more indepth topics',
                      style: GoogleFonts.sourceSans3(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.25),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Column(
                      crossAxisAlignment : CrossAxisAlignment.start,
                      children: [
                        for (var interestTitle in  allSubInterestData.keys )
                          Column(
                            crossAxisAlignment : CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    context.watch<InterestProvider>().getInterestDataByTitle(interestTitle).value,
                                    width: 25,
                                    height: 25,
                                  ),
                                  Container(
                                      margin: const EdgeInsets.only(left: 5.0),
                                      child: Text(
                                        context.watch<InterestProvider>().getInterestDataByTitle(interestTitle).key,

                                        style: GoogleFonts.montserrat(
                                          textStyle: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w800,
                                              letterSpacing: 0.13),
                                        ),

                                      )),],
                              ),
                              const SizedBox(
                                height: 20,
                              ),


                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          for (var subInterestData in allSubInterestData.entries
                                              .firstWhere((element) => element.key == interestTitle)
                                              .value
                                              .sublist(
                                              0,
                                              allSubInterestData.entries
                                                  .firstWhere((element) => element.key == interestTitle)
                                                  .value
                                                  .length ~/
                                                  2))
                                            Row(
                                              children: [
                                                SubInterestChip(subInterestData: subInterestData),
                                                SizedBox(width: 10),
                                              ],
                                            ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          for (var subInterestData in allSubInterestData.entries
                                              .firstWhere((element) => element.key == interestTitle)
                                              .value
                                              .sublist(
                                              allSubInterestData.entries
                                                  .firstWhere((element) => element.key == interestTitle)
                                                  .value
                                                  .length ~/
                                                  2))
                                            Row(
                                              children: [
                                                SubInterestChip(subInterestData: subInterestData),
                                                SizedBox(width: 10),
                                              ],
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                      ],
                    ),



                    /*Column(
                      crossAxisAlignment : CrossAxisAlignment.start,
                      children: [
                        for (var chosenInterestData in context.watch<MainProvider>().getAllChosenInterestData()  )
                          Column(
                            crossAxisAlignment : CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    context.watch<MainProvider>().getInterestDataByTitle(chosenInterestData).value,
                                    width: 25,
                                    height: 25,
                                  ),
                                  Container(
                                      margin: const EdgeInsets.only(left: 5.0),
                                      child: Text(
                                        context.watch<MainProvider>().getInterestDataByTitle(chosenInterestData).key,

                                        style: GoogleFonts.montserrat(
                                          textStyle: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w800,
                                              letterSpacing: 0.13),
                                        ),

                                      )),],
                              ),
                              const SizedBox(
                                height: 20,
                              ),


                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    children: [
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            for (var subInterestData in context.watch<MainProvider>().getSubInterestDataByTitle(chosenInterestData).entries)
                                              Row(
                                                children: [
                                                  SubInterestChip(subInterestData: subInterestData),
                                                  SizedBox(width: 10),
                                                ],
                                              ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            for (var subInterestData in secondHalf)
                                              Row(
                                                children: [
                                                  SubInterestChip(subInterestData: subInterestData),
                                                  SizedBox(width: 10),
                                                ],
                                              ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                      ],
                    ),*/
                  )

                ],
              ),
            ),
          )),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xff474C53),
          border: Border(
            top: BorderSide(
              color: Colors.white,
              width: 1.0,
            ),
          ),
        ),
        padding: const EdgeInsets.fromLTRB(21, 21, 21, 21),
        height: 83,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 50,
          ),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => HomePage()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff00ADB5),
                fixedSize: const Size(300, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              child: const Text(
                "Next",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}