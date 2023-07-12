import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project1/screens/about/widgets/custom_textformfield.dart';
import 'package:project1/screens/about/widgets/txt_widget.dart';
import 'package:project1/screens/onboarding/onboarding_screen.dart';
import 'package:project1/screens/screen1.dart';

class About extends StatelessWidget {
  About({super.key});
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController idController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    final Size screenSize = MediaQuery.of(context).size;
    //final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;
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
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 26,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Text(
                  "Set up your account",
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
                child: Text(
                  "Let us know more about you",
                  style: GoogleFonts.firaSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 38,
              ),
              TxtWidget(
                  txt: "Enter Name",
                  fontSizee: 16,
                  fontWeight: FontWeight.w400),
              const SizedBox(
                height: 8,
              ),
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
              const SizedBox(
                height: 16,
              ),
              TxtWidget(
                  txt: "National ID",
                  fontSizee: 16,
                  fontWeight: FontWeight.w400),
              const SizedBox(
                height: 8,
              ),
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
              const SizedBox(
                height: 16,
              ),
              TxtWidget(
                  txt: "Email", fontSizee: 16, fontWeight: FontWeight.w400),
              const SizedBox(
                height: 8,
              ),
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
              SizedBox(height: screenHeight * 0.3),
              Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                ),
                child: SizedBox(
                  width: 382,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Screen1(),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffFF595A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        )),
                    child: Text(
                      "Continue",
                      style: GoogleFonts.firaSans(
                          fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
