import 'package:flutter/material.dart';
import 'package:lorby_neobis/core/consts/app_fonts.dart';

class LogOutBtn extends StatelessWidget {
  const LogOutBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Text(
          "Выйти",
          style: AppFonts.s16w500.copyWith(color: Colors.black),
        ));
  }
}
