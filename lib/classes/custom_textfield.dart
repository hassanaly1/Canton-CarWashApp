import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String Function(String?)? validator;
  final TextEditingController? controller;
  final String hint;
  //final String label;
  final bool obscureText;
  final TextInputType keyboardType;
  const CustomTextFormField(
      {Key? key,
      this.controller,
      this.validator,
      // required this.label,
      required this.hint,
      this.obscureText = false,
      required this.keyboardType})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.black),
      obscureText: obscureText,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter your $hint';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0XFF535353)),
        filled: true,
        fillColor: Colors.grey[200],
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 0.5),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1.5),
        ),
      ),
    );
  }
}
