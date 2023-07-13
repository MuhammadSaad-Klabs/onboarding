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


class DropdownTextField<T> extends StatefulWidget {
  final List<T> items;
  final String hintText;
  final Function(T?) onChanged;
  final T? value;

  DropdownTextField({
    required this.items,
    required this.hintText,
    required this.onChanged,
    this.value,
  });

  @override
  _DropdownTextFieldState<T> createState() => _DropdownTextFieldState<T>();
}

class _DropdownTextFieldState<T> extends State<DropdownTextField<T>> {
  late T? _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: DropdownButtonFormField<T>(
          value: _selectedItem,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: widget.hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          icon: Image.asset(
            'assets/image/drop.png', 
            width: 24,
            height: 24,
          ),
          items: widget.items.map<DropdownMenuItem<T>>((T value) {
            return DropdownMenuItem<T>(
              value: value,
              child: Text(value.toString()),
            );
          }).toList(),
          onChanged: (T? value) {
            setState(() {
              _selectedItem = value;
            });
            widget.onChanged(value);
          },
        ),
      ),
    );
  }
}

