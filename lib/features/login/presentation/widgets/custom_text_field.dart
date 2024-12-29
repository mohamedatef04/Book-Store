import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.hint,
      this.icon,
      this.controller,
      this.validator,
      required this.obsecureText});
  final String hint;
  IconButton? icon;
  TextEditingController? controller;
  String? Function(String?)? validator;
  final bool obsecureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obsecureText,
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: icon,
        filled: true,
        fillColor: Color.fromARGB(40, 22, 21, 21),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
