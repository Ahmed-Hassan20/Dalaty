import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  String hint;
  TextInputType keyBordType ;
  bool isVisible ;
  TextEditingController controller;
  CustomTextFiled({
    required this.hint,
    required this.keyBordType,
    required this.isVisible,
    required this.controller,
  });
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 4,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 4,
          ),
        ),
          hintText: hint,
        suffixIcon: Icon(Icons.edit),
      ),
      keyboardType: keyBordType,
      obscureText: isVisible,
      controller: controller,
    );
  }
}
