// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingContainer extends StatelessWidget {
  String txt1;
  String txt2;
  String txt3;
  VoidCallback onpressed;
  OnBoardingContainer(
      {super.key,
      required this.txt1,
      required this.txt2,
      required this.txt3,
      required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(txt1,
              style: GoogleFonts.firaSans(
                  fontWeight: FontWeight.w600, fontSize: 28)),
          const SizedBox(
            height: 10,
          ),
          Text(txt2,
              style: GoogleFonts.firaSans(
                  fontWeight: FontWeight.w400, fontSize: 14)),
          Text(txt3,
              style: GoogleFonts.firaSans(
                  fontWeight: FontWeight.w400, fontSize: 14)),
          const SizedBox(
            height: 10,
          ),
          Image.asset("assets/image/lines.png"),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: GestureDetector(
              onTap: onpressed,
              child: Container(
                  height: 48,
                  width: 384,
                  decoration: BoxDecoration(
                      color: const Color(0xffFF595A),
                      borderRadius: BorderRadius.circular(12)),
                  child: const Center(
                      child: Text(
                    "Next",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ))),
            ),
          )
        ],
      ),
    );
  }
}
