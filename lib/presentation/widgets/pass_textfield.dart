import 'package:flutter/material.dart';
import 'package:lorby_neobis/core/consts/app_colors.dart';
import 'package:lorby_neobis/core/consts/app_fonts.dart';
import 'package:lorby_neobis/provider/pass_visibility.dart';
import 'package:provider/provider.dart';

class PassTextField extends StatefulWidget {
  final TextEditingController controller;

  const PassTextField({
    super.key,
    required this.controller,
  });

  @override
  State<PassTextField> createState() => _PassTextFieldState();
}

class _PassTextFieldState extends State<PassTextField> {
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<PassVisibilityProvider>(context);
    return TextField(
      controller: widget.controller,
      obscureText: vm.isVisible,
      decoration: InputDecoration(
          hintText: "Введите пароль",
          hintStyle: AppFonts.s16w500.copyWith(color: AppColors.mediumDark),
          filled: true,
          fillColor: AppColors.textFieldColor,
          suffixIcon: IconButton(
            onPressed: vm.changeVisibility,
            icon: Icon(vm.iconVisibility(), color: AppColors.mediumDark,),
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
