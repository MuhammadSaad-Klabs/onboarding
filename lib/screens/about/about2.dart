import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project1/screens/about/about.dart';
import 'package:project1/screens/about/widgets/custom_textformfield.dart';
import 'package:project1/screens/about/widgets/txt_widget.dart';

class About2 extends StatefulWidget {
  const About2({super.key});

  @override
  State<About2> createState() => _About2State();
}

class _About2State extends State<About2> {
  TextEditingController _dateController = TextEditingController();
  DateTime? _selectedDate;
  Color _maleColor = Colors.white;
  Color _femaleColor = Colors.white;
  Color _maleIconColor = Colors.black12;
  Color _femaleIconColor = Colors.black12;
  Color _maleBorderColor = Colors.black12;
  Color _femaleBorderColor = Colors.black12;
  TextStyle _maleTextStyle = const TextStyle(fontWeight: FontWeight.normal);
  TextStyle _femaleTextStyle = const TextStyle(fontWeight: FontWeight.normal);

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        _dateController.text =
            "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}";
      });
    }
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                MaterialPageRoute(builder: (context) => About()),
              );
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: ScreenUtil().setWidth(24), top: 18),
            child: InkWell(
                child: Text(
              "Skip",
              style: GoogleFonts.firaSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xffFF595A)),
            )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //SizedBox(height: ScreenUtil().setHeight(26)),
            Padding(
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(24)),
              child: Text(
                "Tell us more about you!",
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
            TxtWidget(
              txt: "Employment",
              fontSizee: ScreenUtil().setSp(16),
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: ScreenUtil().setHeight(8)),
            //textfield
            DropdownTextField<String>(
              items: const ['Employed', 'UnEmployed'],
              hintText: 'Select',
              onChanged: (value) {
                setState(() {});
              },
              // value: _selectedItem,
            ),
            SizedBox(height: ScreenUtil().setHeight(16)),
            TxtWidget(
              txt: "Birthdate",
              fontSizee: ScreenUtil().setSp(16),
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: ScreenUtil().setHeight(8)),
            //textfield
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextFormField(
                controller: _dateController,
                onTap: () {
                  _selectDate(context);
                },
                readOnly: true,
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.calendar_month),
                  hintText: 'Birthday',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please select a date';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(16)),
            TxtWidget(
              txt: "Marriage Status",
              fontSizee: ScreenUtil().setSp(16),
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: ScreenUtil().setHeight(8)),
            DropdownTextField<String>(
              items: const ['Married', 'Unmarried'],
              hintText: 'Select',
              onChanged: (value) {
                setState(() {});
              },
              // value: _selectedItem,
            ),
            SizedBox(height: ScreenUtil().setHeight(16)),
            TxtWidget(
              txt: "Gender",
              fontSizee: ScreenUtil().setSp(16),
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: ScreenUtil().setHeight(8)),

            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Row(
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _maleColor =
                                const Color(0xffFFF5F4);
                            _femaleColor = Colors.white;
                            _maleIconColor = const Color(0xffF98576);
                            _femaleIconColor = Colors.black12;
                            _maleBorderColor = const Color(0xffF98576);
                            _femaleBorderColor = Colors.black12;
                            //_maleTextStyle = TextStyle(fontWeight: FontWeight.bold);
                            _femaleTextStyle =
                                const TextStyle(fontWeight: FontWeight.normal);
                            _maleTextStyle = _femaleTextStyle.copyWith(
                              fontWeight: FontWeight.bold,
                              color: const Color(0xffF98576),
                            );
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: _maleBorderColor,
                              width: 2.0,
                            ),
                          ),
                          child: CircleAvatar(
                              backgroundColor: _maleColor,
                              radius: 60,
                              child:  SvgPicture.asset("assets/image/man.svg",color: _maleIconColor,))),
                        ),
                      const SizedBox(height: 8),
                      Text(
                        'Male',
                        style: _maleTextStyle,
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _maleColor = Colors.white;
                            _femaleColor =
                                const Color(0xffFFF5F4);
                            _maleIconColor = Colors.black12;
                            _femaleIconColor = const Color(0xffF98576);
                            _maleBorderColor = Colors.black12;
                            _femaleBorderColor = const Color(0xffF98576);
                            _maleTextStyle =
                                const TextStyle(fontWeight: FontWeight.normal);
                            // _femaleTextStyle = TextStyle(fontWeight: FontWeight.bold);
                            _femaleTextStyle = _femaleTextStyle.copyWith(
                              fontWeight: FontWeight.bold,
                              color: const Color(0xffF98576),
                            );
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: _femaleBorderColor,
                              width: 2.0,
                            ),
                          ),
                          child: CircleAvatar(
                              backgroundColor: _femaleColor,
                              radius: 60,
                              child:  SvgPicture.asset("assets/image/woman.svg",color: _femaleIconColor,)
                              )),
                        ),
                      const SizedBox(height: 8),
                      Text(
                        'Female',
                        style: _femaleTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: ScreenUtil().screenHeight * 0.03),
              Padding(
                padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(24),
                  right: ScreenUtil().setWidth(24),
                ),
                child: SizedBox(
                  width: 382,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      // if (_formKey.currentState!.validate()) {
                      //   Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => const Screen1()),
                      //   );
                      // }
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
    );
  }
}
