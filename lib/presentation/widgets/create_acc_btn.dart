import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lorby_neobis/core/consts/app_fonts.dart';
import 'package:lorby_neobis/presentation/router/app_router.gr.dart';

class CreateAccBtn extends StatelessWidget {
  const CreateAccBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          context.router.push(const SignUpRoute());
        },
        child: Text(
          "У меня еще нет аккаунта",
          style: AppFonts.s16w500.copyWith(color: Colors.black),
        ));
  }
}
