import 'package:flutter/material.dart';
import 'package:lorby_neobis/core/consts/app_colors.dart';
import 'package:lorby_neobis/core/consts/app_fonts.dart';
// import 'package:lorby_neobis/provider/btn_activity.dart';
// import 'package:provider/provider.dart';

class LoginBtn extends StatefulWidget {
  final Function() onPressed;
  const LoginBtn({super.key, required this.onPressed});

  @override
  State<LoginBtn> createState() => _LoginBtnState();
}

class _LoginBtnState extends State<LoginBtn> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    // final vm = Provider.of<ButtonActivity>(context);
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              disabledBackgroundColor: const Color.fromARGB(255, 199, 199, 199),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 17),
            child: Text(
              "Войти",
              style: AppFonts.s16w500.copyWith(color: AppColors.mediumDark),
            ),
          )),
    );
  }
}


