import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintTextt;
  final TextInputType textInputType;
  final String? Function(String?)? validator;

  const TextFieldWidget({
    Key? key,
    required this.textEditingController,
    this.isPass = false,
    required this.hintTextt,
    required this.textInputType,
    this.validator,
  }) : super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: TextFormField(
        controller: widget.textEditingController,
        keyboardType: widget.textInputType,
        obscureText: _obscureText && widget.isPass,
        validator: widget.validator,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12), // Set the border radius to 12
            borderSide: const BorderSide(color: Colors.black),
          ),
          hintText: widget.hintTextt,
          suffixIcon: widget.isPass
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
