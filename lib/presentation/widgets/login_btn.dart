import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lorby_neobis/core/consts/app_colors.dart';
import 'package:lorby_neobis/core/consts/app_fonts.dart';
import 'package:lorby_neobis/presentation/router/app_router.gr.dart';
import 'package:lorby_neobis/presentation/screens/home_screen.dart';
import 'package:lorby_neobis/provider/btn_activity.dart';
import 'package:provider/provider.dart';

class LoginBtn extends StatefulWidget {
  const LoginBtn({super.key});

  @override
  State<LoginBtn> createState() => _LoginBtnState();
}

class _LoginBtnState extends State<LoginBtn> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ButtonActivity>(context);
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () {
            //vm.callErrorBlock();
            // Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
            context.router.push(const HomeRoute());
          },
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


