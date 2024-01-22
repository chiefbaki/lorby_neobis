import 'package:flutter/material.dart';
import 'package:lorby_neobis/core/consts/app_colors.dart';
import 'package:lorby_neobis/core/consts/app_fonts.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const LoginTextField({super.key, required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppFonts.s16w500.copyWith(color: AppColors.mediumDark),
          filled: true,
          fillColor: AppColors.textFieldColor,
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.textFieldColor),
              borderRadius: BorderRadius.circular(12)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.textFieldColor),
              borderRadius: BorderRadius.circular(12))),
    );
  }
}
