import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/interest_provider.dart';

class SubInterestChip extends StatelessWidget {
  SubInterestChip({required this.subInterestData, super.key});

   MapEntry<String, String> subInterestData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
    context.read<InterestProvider>().subInterestChipToggle(subInterestData.key);

      },
      borderRadius: const BorderRadius.all(Radius.circular(40.0)),
      child: Container(
          padding: const EdgeInsets.fromLTRB(8.0, 3.0, 8.0, 3.0),
          decoration: BoxDecoration(
            color: context
                .watch<InterestProvider>()
                .checkSubInterestChipSelection(subInterestData.key) ==
                true
                ? const Color(0xfff3f4f5)
                : Colors.transparent,
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(30.0)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  child: Image.asset(
                    subInterestData.value,
                    width: 35,
                    height: 35,
                  )),
              Container(
                  margin: const EdgeInsets.only(left: 5.0),
                  // color: Colors.pinkAccent,
                  child: Text(
                    subInterestData.key,

                    style: GoogleFonts.sourceSans3(
                      textStyle:  TextStyle(
                          color: context
                              .watch<InterestProvider>()
                              .checkSubInterestChipSelection(subInterestData.key) ==
                              true
                              ? Colors.black
                              : Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.4),
                    ),


                  )),

            ],
          )
      ),
    );
  }
}