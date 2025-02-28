import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText(
      {super.key, this.hintText, required this.onchange,this.obscureText=true,this.inputType});

  String? hintText;
  TextInputType? inputType;
  bool obscureText=true;
  Function(String) onchange;

  @override
  Widget build(BuildContext context) {
    return TextField(

      style: const TextStyle(color: Colors.black),

      obscureText: obscureText,
      keyboardType: inputType,
      onChanged: onchange,
      decoration: InputDecoration(
          enabledBorder:
           OutlineInputBorder(borderSide: const BorderSide(color: Colors.black),borderRadius: BorderRadius.circular(16)),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          border:
          const OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),
    );
  }
}