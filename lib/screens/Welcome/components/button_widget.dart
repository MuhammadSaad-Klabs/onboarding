// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  String BtnTxt;
  
  ButtonWidget({super.key,required this.BtnTxt,});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 24,right: 24),
      child: SizedBox(
        width: 382,
        height: 56,
        child: ElevatedButton(
          onPressed: (){},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffFF595A),
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), 
           )),
          child: Text(BtnTxt,style: GoogleFonts.firaSans(fontSize: 16,fontWeight: FontWeight.w700),),
        ),
      ),
    );
  }
}

class ButtonWidget2 extends StatelessWidget {
  String BtnTxt;
  ButtonWidget2({super.key,required this.BtnTxt});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 24,right: 24),
      child: SizedBox(
        width: 382,
        height: 56,
        child: ElevatedButton(
          onPressed: (){},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffFFFFFF),
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), 
           )),
           child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(Icons.key,color: Colors.black,) ,
              const SizedBox(width: 76,),
              Text(BtnTxt,style: GoogleFonts.firaSans(fontSize: 16,fontWeight: FontWeight.w700,textStyle: const TextStyle(color: Colors.black)),),
            ],
           ),
           
        ),
      ),
    );
  }
}

class ButtonWidget3 extends StatelessWidget {
  String BtnTxt;
  ButtonWidget3({super.key,required this.BtnTxt});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 24,right: 24,bottom: 36,top: 36),
      child: SizedBox(
        width: 110,
        height: 32,
        child: ElevatedButton(
          onPressed: (){},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffFFFFFF),
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), 
           )),
          child: Text(BtnTxt,style: GoogleFonts.firaSans(fontSize: 11,fontWeight: FontWeight.w500,textStyle: const TextStyle(color: Colors.black)),),
        ),
      ),
    );
  }
}