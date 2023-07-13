import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:project1/screens/Welcome/components/button_widget.dart';

class Welcome2 extends StatelessWidget {
  const Welcome2({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      backgroundColor: const Color(0xffF7F3F1),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: ScreenUtil().setHeight(80)),
            Image.asset(
              "assets/image/logo2.png",
              width: ScreenUtil().setWidth(188.34),
              height: ScreenUtil().setHeight(64),
            ),
            SizedBox(height: ScreenUtil().setHeight(40)),
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
            Padding(
              padding: EdgeInsets.all(ScreenUtil().setWidth(24)),
              child: IntlPhoneField(
                flagsButtonPadding: EdgeInsets.all(ScreenUtil().setWidth(8)),
                dropdownIconPosition: IconPosition.trailing,
                decoration: InputDecoration(
                  hintText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(ScreenUtil().setWidth(12)),
                    borderSide: BorderSide(),
                  ),
                ),
                initialCountryCode: 'BH',
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
              ),
            ),
            ButtonWidget(BtnTxt: "Continue"),
            SizedBox(height: ScreenUtil().setHeight(32)),
            Padding(
              padding: EdgeInsets.only(
                right: ScreenUtil().setWidth(56),
                left: ScreenUtil().setWidth(60),
              ),
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
    );
  }
}
