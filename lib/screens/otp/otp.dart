import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24.0),
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
            const SizedBox(
              height: 26,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Text(
                "Enter verification code",
                style: GoogleFonts.firaSans(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Row(
                children: [
                  Text(
                    "We sent a code to your number ",
                    style: GoogleFonts.firaSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "+973 36847302",
                    style: GoogleFonts.firaSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OtpTextField(
                    numberOfFields: 4,
                    borderColor: Colors.black,
                    // Set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    // Runs when a code is typed in
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
                    // Runs when every text field is filled
                    onSubmit: (String verificationCode) {
                      setState(() {
                        isButtonDisabled = false;
                        otpList.clear();
                      });
                      // showDialog(
                      //   context: context,
                      //   builder: (context) {
                      //     return AlertDialog(
                      //       title: Text("Verification Code"),
                      //       content: Text('Code entered is $verificationCode'),
                      //     );
                      //   },
                      // );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Row(
                children: [
                  Text(
                    "Didn’t receive the code? ",
                    style: GoogleFonts.firaSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  showPinkResendText
                      ? Text(
                          "Resend",
                          style: GoogleFonts.firaSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.pink, // Change to pink color
                          ),
                        )
                      : Text(
                          "Resend in: 00:${_start.toString().padLeft(2, '0')}",
                          style: GoogleFonts.firaSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                ],
              ),
            ),
            const SizedBox(
              height: 199,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Container(
                width: 382,
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: isButtonDisabled
                      ? const Color.fromARGB(255, 219, 162, 181)
                          .withOpacity(0.5)
                      : const Color(0xffFF595A),
                ),
                child: ElevatedButton(
                  onPressed: isButtonDisabled ? null : () {
                    Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  About(),
                          ),
                        );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Continue",
                    style: GoogleFonts.firaSans(
                      fontSize: 16,
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
