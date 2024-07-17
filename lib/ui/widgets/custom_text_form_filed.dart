import 'package:flutter/material.dart';
import 'package:graduationproject/ui/utils/app_theme.dart';

class CustomTextFormFiled extends StatelessWidget {
  String hintText ;
  TextInputType keyBordType ;
  bool isVisible ;
  TextEditingController controller;
  String? Function(String?) myValidator;
  Widget? icon;
  CustomTextFormFiled({required this.hintText,
    this.keyBordType = TextInputType.text,
    this.isVisible = false,
    required this.controller,
    required this.myValidator,
    this.icon ,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
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
          filled: true,
          fillColor: Theme.of(context).primaryColor,
          hintText: hintText,
          hintStyle: TextStyle(
            color: MyTheme.whiteColor,
          ),
          suffixIcon: icon,
        ),
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
          color: MyTheme.whiteColor,
        ),
        keyboardType: keyBordType,
        obscureText: isVisible,
        controller: controller,
        validator: myValidator,
        autofocus: false,
        // controller: ,
      ),
    );
  }
}
