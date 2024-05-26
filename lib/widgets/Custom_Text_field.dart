import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextField extends StatefulWidget {
  TextEditingController controller;
  double? width;
  double? height;
  String placeholder;
  Icon? prifixicon;
  Widget? suffixicon;
  bool is_obscures = false;
  Color? fillcolor;
  ValueChanged<String>? OnChanged;
  CustomTextField(
      {super.key,
      this.OnChanged,
      required this.controller,
      this.width,
      this.height,
      this.placeholder = '',
      this.prifixicon = null,
      this.suffixicon = null,
      is_obscures,
      this.fillcolor});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.is_obscures;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: TextField(
        onChanged: widget.OnChanged,
        obscureText: _isObscured,
        controller: widget.controller,
        decoration: InputDecoration(
            hintStyle: TextStyle(
              fontSize: MediaQuery.of(context).size.height / 45,
              color: const Color.fromARGB(137, 104, 104, 104),
            ),
            filled: true,
            fillColor: widget.fillcolor,
            prefixIcon: widget.prifixicon,
            suffixIcon: widget.suffixicon,
            hintText: (widget.placeholder),
            border: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 0.1, color: Theme.of(context).colorScheme.tertiary),
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
