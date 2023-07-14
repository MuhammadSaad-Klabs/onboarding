import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class privacy extends StatelessWidget {
  const privacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){showPrivacy(context);}, 
            child: const Text("Privacy"))
          ],
        ),
      ),
    );
  }

  Future<void> showterms(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xffFFF5F4),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      builder: (BuildContext context) {
        
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: 1000,
              
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            
                            IconButton(onPressed: ()=> Navigator.pop(context), icon: const Icon(Icons.close_outlined),color: Colors.black,),
                          ],
                        )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:16,top:5),
                      child: Text("Terms and Conditions",style:GoogleFonts.firaSans(fontSize:24,fontWeight: FontWeight.w600,color: Colors.black )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:16,top:5,right: 26),
                      child: Text("Welcome to our website! These Terms and Conditions govern your use of this website, including all content, features, and services provided. By accessing or using this website, you agree to comply with these Terms and Conditions. Please read them carefully before proceeding.",style:GoogleFonts.firaSans(fontSize:14,fontWeight: FontWeight.w400,color: const Color(0xff454545) ))
                    ),
                    const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left:16,top:5,right: 26),
                      child: Text("1-Acceptance of Terms By accessing or using this website, you acknowledge that you have read, understood, and agree to be bound by these Terms and Conditions. If you do not agree with any part of these Terms and Conditions, please refrain from using this website.",style:GoogleFonts.firaSans(fontSize:14,fontWeight: FontWeight.w400,color: const Color(0xff454545) )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:16,top:5,right: 26),
                      child: Text("2-Intellectual Property Rights All content, trademarks, logos, and materials available on this website are the property of their respective owners and protected by intellectual property laws. You may not use, reproduce, distribute, or modify any content from this website without the prior written consent of the respective owner.",style:GoogleFonts.firaSans(fontSize:14,fontWeight: FontWeight.w400,color: const Color(0xff454545) )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:16,top:5,right: 26),
                      child: Text("3-Use of Website You agree to use this website for lawful purposes only and in a manner that does not infringe or restrict the rights of others. You will not engage in any activity that could harm, disable, overburden, or impair the website or interfere with the use of this website by others.",style:GoogleFonts.firaSans(fontSize:14,fontWeight: FontWeight.w400,color: const Color(0xff454545) )),
                    ), 
                    Padding(
                      padding: const EdgeInsets.only(left:16,top:5,right: 26),
                      child: Text("4-Third-Party Websites This website may contain links to third-party websites for your convenience. We do not endorse or assume any responsibility for the content or practices of these third-party websites. Your use of third-party websites is at your own risk and subject to their respective terms and conditions.",style:GoogleFonts.firaSans(fontSize:14,fontWeight: FontWeight.w400,color: const Color(0xff454545) )),
                    ),  
                    const SizedBox(height: 100,) 
                    ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<void> showPrivacy(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xffFFF5F4),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      builder: (BuildContext context) {
        
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: 1000,
              
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            
                            IconButton(onPressed: ()=> Navigator.pop(context), icon: const Icon(Icons.close_outlined),color: Colors.black,),
                          ],
                        )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:16,top:5),
                      child: Text("Privacy and Policy",style:GoogleFonts.firaSans(fontSize:24,fontWeight: FontWeight.w600,color: Colors.black )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:16,top:5,right: 26),
                      child: Text("Please read these privacy policy, carefully before using our app operated by us.",style:GoogleFonts.firaSans(fontSize:14,fontWeight: FontWeight.w400,color: const Color(0xff454545) ))
                    ),
                    const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left:16,top:5,right: 26),
                      child: Text("Privacy Policy",style:GoogleFonts.firaSans(fontSize:14,fontWeight: FontWeight.w400,color: const Color(0xff454545) ))
                    ),
                    const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left:16,top:5,right: 26),
                      child: Text("1-Acceptance of Terms By accessing or using this website, you acknowledge that you have read, understood, and agree to be bound by these Terms and Conditions. If you do not agree with any part of these Terms and Conditions, please refrain from using this website.",style:GoogleFonts.firaSans(fontSize:14,fontWeight: FontWeight.w400,color: const Color(0xff454545) )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:16,top:5,right: 26),
                      child: Text("2-Intellectual Property Rights All content, trademarks, logos, and materials available on this website are the property of their respective owners and protected by intellectual property laws. You may not use, reproduce, distribute, or modify any content from this website without the prior written consent of the respective owner.",style:GoogleFonts.firaSans(fontSize:14,fontWeight: FontWeight.w400,color: const Color(0xff454545) )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:16,top:5,right: 26),
                      child: Text("3-Use of Website You agree to use this website for lawful purposes only and in a manner that does not infringe or restrict the rights of others. You will not engage in any activity that could harm, disable, overburden, or impair the website or interfere with the use of this website by others.",style:GoogleFonts.firaSans(fontSize:14,fontWeight: FontWeight.w400,color: const Color(0xff454545) )),
                    ), 
                    Padding(
                      padding: const EdgeInsets.only(left:16,top:5,right: 26),
                      child: Text("4-Third-Party Websites This website may contain links to third-party websites for your convenience. We do not endorse or assume any responsibility for the content or practices of these third-party websites. Your use of third-party websites is at your own risk and subject to their respective terms and conditions.",style:GoogleFonts.firaSans(fontSize:14,fontWeight: FontWeight.w400,color: const Color(0xff454545) )),
                    ),  
                    const SizedBox(height: 100,) 
                    ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}