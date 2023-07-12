// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TxtWidget extends StatelessWidget {
  String txt;
  double fontSizee;
  FontWeight fontWeight;

  TxtWidget({super.key,required this.txt,required this.fontSizee,required this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Text(
                      txt,
                      style: GoogleFonts.firaSans(
                        fontSize: fontSizee,
                        fontWeight: fontWeight,
                        color: Colors.black,
                      ),
                    ),
            );
  }
}