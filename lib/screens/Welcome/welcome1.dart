import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:project1/screens/Welcome/components/button_widget.dart';

class Welcome1 extends StatelessWidget {
  const Welcome1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F3F1),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
      hasScrollBody: false,
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 122,
            ),
            Image.asset(
              "assets/image/logo2.png",
              width: 188.34,
              height: 64,
            ),
            const SizedBox(
              height: 48,
            ),
            Text("Welcome to Baity",
                style: GoogleFonts.firaSans(
                    fontSize: 28, fontWeight: FontWeight.w700)),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Create your account to get started and have a personalized experience.",
              style:
                  GoogleFonts.firaSans(fontSize: 16, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 48,
            ),
            Expanded(
              child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12.0),
                        topLeft: Radius.circular(15.0),
                      )),
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: IntlPhoneField(
                            flagsButtonPadding: const EdgeInsets.all(8),
                            dropdownIconPosition: IconPosition.trailing,
                            decoration: InputDecoration(
                              hintText: 'Phone Number',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: const BorderSide(),
                              ),
                            ),
                            initialCountryCode: 'BH',
                            onChanged: (phone) {
                              print(phone.completeNumber);
                            },
                          )),
                      ButtonWidget(
                        BtnTxt: "Continue",
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('OR',style: TextStyle(color: Colors.grey),),
                            ),
                            Expanded(
                              child: Divider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ButtonWidget2(BtnTxt: "Continue with key"),
                      const SizedBox(height: 32,),
                      Padding(
                        padding: const EdgeInsets.only(right: 56,left: 60),
                        child: Text(
                          "By signing up, you agree to our Terms of Service and acknowledge that you have read our Privacy Policy",
                          style: GoogleFonts.firaSans(
                              fontSize: 12, fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      ButtonWidget3(BtnTxt: "Join as a Guest")
                    ],
                    
                  )),
            )
          ],
        ),
        
      )]
      ),
    );
  }
}
