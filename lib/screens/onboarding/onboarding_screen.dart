import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project1/screens/Welcome/welcome1.dart';
import 'package:project1/screens/onboarding/onboarding_contents.dart';
import 'package:project1/screens/onboarding/size_config.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  int _currentPage = 0;
  List colors = const [
    Color(0xffFFFFFF),
    Color(0xffFFFFFF),
    Color(0xffFFFFFF),
    Color(0xffFFFFFF),
  ];

  AnimatedContainer _buildDots({
    int? index,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        color: Color(0xffD3A18C),
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: _currentPage == index ? 20 : 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;

    return Scaffold(
      backgroundColor: colors[_currentPage],
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: _controller,
                onPageChanged: (value) => setState(() => _currentPage = value),
                itemCount: contents.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 40.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white),
                                onPressed: () {},
                                child: const Text(
                                  "العربية",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                )),
                            Image.asset("assets/image/logo2.png"),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white),
                                onPressed: () {},
                                child: const Text(
                                  "Skip",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                )),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Image.asset(
                          contents[i].image,
                          height: 300,
                        ),
                        SizedBox(
                          height: (height >= 840) ? 60 : 30,
                        ),
                        Text(contents[i].title,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.firaSans(
                                fontWeight: FontWeight.w600, fontSize: 24)),
                        const SizedBox(height: 15),
                        Text(
                          contents[i].desc,
                          style: GoogleFonts.firaSans(
                              fontWeight: FontWeight.w400, fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 15),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                contents.length,
                                (int index) => _buildDots(
                                  index: index,
                                ),
                              ),
                            ),
                            const SizedBox(height: 25),
                            _currentPage + 1 == contents.length
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 30, left: 10, right: 10),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Welcome1()),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xffFF595A),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        padding: (width <= 550)
                                            ? const EdgeInsets.symmetric(
                                                horizontal: 150, vertical: 20)
                                            : EdgeInsets.symmetric(
                                                horizontal: width * 0.3,
                                                vertical: 25),
                                        textStyle: TextStyle(
                                            fontSize: (width <= 550) ? 13 : 17),
                                      ),
                                      child:  Text("Next",style: GoogleFonts.firaSans(fontWeight: FontWeight.w700,fontSize: 16),),
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 30, left: 10, right: 10),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        _controller.nextPage(
                                          duration:
                                              const Duration(milliseconds: 200),
                                          curve: Curves.easeIn,
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xffFF595A),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        padding: (width <= 550)
                                            ? const EdgeInsets.symmetric(
                                                horizontal: 150, vertical: 20)
                                            : EdgeInsets.symmetric(
                                                horizontal: width * 0.3,
                                                vertical: 25),
                                        textStyle: TextStyle(
                                            fontSize: (width <= 550) ? 13 : 17),
                                      ),
                                      child:  Text("Next",style: GoogleFonts.firaSans(fontWeight: FontWeight.w700,fontSize: 16),),
                                    ),
                                  )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
