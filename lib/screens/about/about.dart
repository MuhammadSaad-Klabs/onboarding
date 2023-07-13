import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project1/screens/about/about2.dart';
import 'package:project1/screens/about/widgets/custom_textformfield.dart';
import 'package:project1/screens/about/widgets/txt_widget.dart';
import 'package:project1/screens/onboarding/onboarding_screen.dart';

class About extends StatefulWidget {
  About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController idController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));

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
                MaterialPageRoute(builder: (context) => const OnboardingScreen()),
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
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: ScreenUtil().setHeight(26)),
              Padding(
                padding: EdgeInsets.only(left: ScreenUtil().setWidth(24)),
                child: Text(
                  "Set up your account",
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
                child: Text(
                  "Let us know more about you",
                  style: GoogleFonts.firaSans(
                    fontSize: ScreenUtil().setSp(16),
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(38)),
              Column(
                children: [],
              ),
              TxtWidget(
                txt: "Enter Name",
                fontSizee: ScreenUtil().setSp(16),
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: ScreenUtil().setHeight(8)),
              TextFieldWidget(
                textEditingController: nameController,
                hintTextt: "Enter your Name",
                textInputType: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Name cannot be empty!";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: ScreenUtil().setHeight(16)),
              TxtWidget(
                txt: "National ID",
                fontSizee: ScreenUtil().setSp(16),
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: ScreenUtil().setHeight(8)),
              TextFieldWidget(
                textEditingController: idController,
                hintTextt: "Enter your National ID",
                textInputType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "National ID cannot be empty!";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: ScreenUtil().setHeight(16)),
              TxtWidget(
                txt: "Email",
                fontSizee: ScreenUtil().setSp(16),
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: ScreenUtil().setHeight(8)),
              TextFieldWidget(
                textEditingController: emailController,
                hintTextt: "Enter your Email",
                textInputType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Email cannot be empty!";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: ScreenUtil().screenHeight * 0.2),
              Padding(
                padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(24),
                  right: ScreenUtil().setWidth(24),
                ),
                child: SizedBox(
                  width: ScreenUtil().setWidth(382),
                  height: ScreenUtil().setHeight(56),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const About2()),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffFF595A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          ScreenUtil().setWidth(12),
                        ),
                      ),
                    ),
                    child: Text(
                      "Continue",
                      style: GoogleFonts.firaSans(
                        fontSize: ScreenUtil().setSp(16),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: ScreenUtil().screenHeight * 0.01),
            ],
          ),
        ),
      ),
    );
  }
}
