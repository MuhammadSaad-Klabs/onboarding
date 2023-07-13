import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:project1/screens/Welcome/components/button_widget.dart';

class Welcome1 extends StatelessWidget {
  const Welcome1({super.key});

 @override
Widget build(BuildContext context) {
  ScreenUtil.init(context);

  return Scaffold(
    backgroundColor: const Color(0xffF7F3F1),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: ScreenUtil().setHeight(30)),
        Image.asset(
          "assets/image/logo2.png",
          width: ScreenUtil().setWidth(188.34),
          height: ScreenUtil().setHeight(64),
        ),
        SizedBox(height: ScreenUtil().setHeight(10)),
        Text(
          "Welcome to Baity",
          style: GoogleFonts.firaSans(
            fontSize: ScreenUtil().setSp(28),
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: ScreenUtil().setHeight(16)),
        Text(
          "Create your account to get started and have a personalized experience.",
          style: GoogleFonts.firaSans(
            fontSize: ScreenUtil().setSp(16),
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: ScreenUtil().setHeight(48)),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(ScreenUtil().setWidth(12)),
                topLeft: Radius.circular(ScreenUtil().setWidth(15)),
              ),
            ),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween, // Added this line
              children: [
                Padding(
                  padding: EdgeInsets.all(ScreenUtil().setWidth(24)),
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
                          )
                ),
                ButtonWidget(BtnTxt: "Continue"),
                Padding(
                  padding: EdgeInsets.all(ScreenUtil().setWidth(8)),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                          thickness: ScreenUtil().setWidth(1),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(ScreenUtil().setWidth(8)),
                        child: const Text(
                          'OR',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                          thickness: ScreenUtil().setWidth(1),
                        ),
                      ),
                    ],
                  ),
                ),
                ButtonWidget2(BtnTxt: "Continue with key"),
                SizedBox(height: ScreenUtil().setHeight(20)),
                Padding(
                  padding: EdgeInsets.only(right: ScreenUtil().setWidth(56), left: ScreenUtil().setWidth(60)),
                  child: Text(
                    "By signing up, you agree to our Terms of Service and acknowledge that you have read our Privacy Policy",
                    style: GoogleFonts.firaSans(
                      fontSize: ScreenUtil().setSp(12),
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(55)),
                ButtonWidget3(BtnTxt: "Join as a Guest"),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}


}
