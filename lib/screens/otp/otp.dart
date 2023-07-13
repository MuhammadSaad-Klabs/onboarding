import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project1/screens/about/about.dart';
import 'dart:async';

import 'package:project1/screens/onboarding/onboarding_screen.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  bool isButtonDisabled = true;
  bool showPinkResendText = false;
  Timer? _timer;
  int _start = 60;
  List<String> otpList = List.generate(4, (index) => "");

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            showPinkResendText = true;
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  bool isAllOtpFilled() {
    for (var otp in otpList) {
      if (otp.isEmpty) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Padding(
          padding: EdgeInsets.only(left: ScreenUtil().setWidth(24)),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const OnboardingScreen()),
              );
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: ScreenUtil().setHeight(26)),
            Padding(
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(24)),
              child: Text(
                "Enter verification code",
                style: GoogleFonts.firaSans(
                  fontSize: ScreenUtil().setSp(24),
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(12)),
            Padding(
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(24)),
              child: Row(
                children: [
                  Text(
                    "We sent a code to your number ",
                    style: GoogleFonts.firaSans(
                      fontSize: ScreenUtil().setSp(14),
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "+973 36847302",
                      style: GoogleFonts.firaSans(
                        fontSize: ScreenUtil().setSp(14),
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(30)),
            Padding(
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(24)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OtpTextField(
                    borderRadius: BorderRadius.circular(12),
                    focusedBorderColor: Colors.black,
                    fieldWidth:50,
                    numberOfFields: 4,
                    borderColor: Colors.black,
                    showFieldAsBox: true,
                    onCodeChanged: (String code) {
                      for (var i = 0; i < otpList.length; i++) {
                        if (i < code.length) {
                          otpList[i] = code[i];
                        } else {
                          otpList[i] = "";
                        }
                      }
                      setState(() {
                        isButtonDisabled = !isAllOtpFilled();
                      });
                    },
                    onSubmit: (String verificationCode) {
                      setState(() {
                        isButtonDisabled = false;
                        otpList.clear();
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(32)),
            Padding(
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(24)),
              child: Row(
                children: [
                  Text(
                    "Didn’t receive the code? ",
                    style: GoogleFonts.firaSans(
                      fontSize: ScreenUtil().setSp(12),
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  showPinkResendText
                      ? Text(
                          "Resend",
                          style: GoogleFonts.firaSans(
                            fontSize: ScreenUtil().setSp(12),
                            fontWeight: FontWeight.w300,
                            color: const Color(0xffFF595A),
                          ),
                        )
                      : Text(
                          "Resend in: 00:${_start.toString().padLeft(2, '0')}",
                          style: GoogleFonts.firaSans(
                            fontSize: ScreenUtil().setSp(12),
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                          ),
                        ),
                ],
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(199)),
            Padding(
              padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(24),
                  right: ScreenUtil().setWidth(24)),
              child: Container(
                width: ScreenUtil().setWidth(382),
                height: ScreenUtil().setHeight(56),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(ScreenUtil().setWidth(12)),
                  color: isButtonDisabled
                      ? const Color(0xffFFBDBD).withOpacity(0.5)
                      : const Color(0xffFF595A),
                ),
                child: ElevatedButton(
                  onPressed: isButtonDisabled
                      ? null
                      : () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => About(),
                            ),
                          );
                        },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(ScreenUtil().setWidth(12)),
                    ),
                  ),
                  child: Text(
                    "Continue",
                    style: GoogleFonts.firaSans(
                      fontSize: ScreenUtil().setSp(16),
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
