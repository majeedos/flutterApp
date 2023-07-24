import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:radio/onboarding/sub_interests_page.dart';
import '../../providers/interest_provider.dart';
import 'interest_chip.dart';




class InterestsPage extends StatelessWidget {
  const InterestsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff222831),
      extendBody: false,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(20.0),
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
              Text(
                'Get Better recommendations',
                style: GoogleFonts.sourceSans3(
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.25),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Wrap(
                spacing: 20.0,
                runSpacing: 20.0,
                children: [
                  for (var interestData in context.watch<InterestProvider>().interestsData.entries  )
                    InterestChip(interestData: interestData,),
                ],
              ),
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
                    MaterialPageRoute(builder: (builder) => SubInterestsPage()));
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


