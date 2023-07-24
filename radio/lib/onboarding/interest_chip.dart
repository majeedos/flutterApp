

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/interest_provider.dart';

class InterestChip extends StatelessWidget {
  InterestChip({required this.interestData, super.key});

  MapEntry<String, String> interestData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<InterestProvider>().interestChipToggle(interestData.key);

      },
      borderRadius: const BorderRadius.all(Radius.circular(30.0)),
      child: Container(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          decoration: BoxDecoration(
            color: context
                .watch<InterestProvider>()
                .checkInterestChipSelection(interestData.key) ==
                true
                ? const Color(0xfff3f4f5)
                : Colors.transparent,
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(40.0)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                interestData.value,
                width: 30,
                height: 30,
              ),
              Container(
                  margin: const EdgeInsets.only(left: 10.0),
                  // color: Colors.pinkAccent,
                  child: Text(
                    interestData.key,

                    style: GoogleFonts.sourceSans3(
                      textStyle:  TextStyle(
                          color: context
                              .watch<InterestProvider>()
                              .checkInterestChipSelection(interestData.key) ==
                              true
                              ? Colors.black
                              : Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.25),
                    ),

                  )),
            ],
          )
      ),
    );
  }
}