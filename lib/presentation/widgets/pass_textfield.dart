import 'package:flutter/material.dart';
import 'package:lorby_neobis/core/consts/app_colors.dart';
import 'package:lorby_neobis/core/consts/app_fonts.dart';

class PassTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final Function() onPressed;
  final bool isVisible;
  const PassTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.onPressed,
      required this.isVisible});

  @override
  State<PassTextField> createState() => _PassTextFieldState();
}

class _PassTextFieldState extends State<PassTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.isVisible,
      decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: AppFonts.s16w500.copyWith(color: AppColors.mediumDark),
          filled: true,
          fillColor: AppColors.textFieldColor,
          suffixIcon: IconButton(
            onPressed: widget.onPressed,
            icon: Icon(widget.isVisible
                ? Icons.visibility_off
                : Icons.visibility_sharp),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.textFieldColor),
              borderRadius: BorderRadius.circular(12)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.textFieldColor),
              borderRadius: BorderRadius.circular(12))),
    );
  }
}
