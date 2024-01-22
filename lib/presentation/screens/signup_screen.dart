import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lorby_neobis/core/consts/app_colors.dart';
import 'package:lorby_neobis/core/consts/app_fonts.dart';
import 'package:lorby_neobis/presentation/bloc/register_bloc.dart';
import 'package:lorby_neobis/presentation/bloc/register_event.dart';
import 'package:lorby_neobis/presentation/widgets/login_btn.dart';
import 'package:lorby_neobis/presentation/widgets/login_textfield.dart';
import 'package:lorby_neobis/presentation/widgets/pass_textfield.dart';



@RoutePage()
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});


  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController passwordConfirmController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Регистрация",
          style: AppFonts.s16w500.copyWith(color: AppColors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.black,
            )),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 54.h,
            ),
            Center(
                child: Text(
              "Создать аккаунт Lorby",
              style: AppFonts.s24w500.copyWith(color: AppColors.black),
            )),
            SizedBox(
              height: 24.h,
            ),
            LoginTextField(
                controller: emailController, hintText: "Введи адрес почты"),
            SizedBox(
              height: 14.h,
            ),
            LoginTextField(
                controller: usernameController, hintText: "Придумай логин"),
            SizedBox(
              height: 14.h,
            ),
            PassTextField(
                controller: passwordController, hintText: "Создай пароль"),
            SizedBox(
              height: 6.h,
            ),
            Container(
              height: 80.h,
              width: 235.w,
              decoration: const BoxDecoration(color: Colors.red),
            ),
            SizedBox(
              height: 14.h,
            ),
            PassTextField(
                controller: passwordConfirmController,
                hintText: "Повтори пароль"),
            SizedBox(
              height: 24.h,
            ),
            LoginBtn(
              onPressed: () {
                BlocProvider.of<RegisterBloc>(context).add(UserRegisterEvent(
                    email: emailController.text,
                    username: usernameController.text,
                    password: passwordController.text,
                    passwordConfirm: passwordConfirmController.text));
              },
            ),
          ],
        ),
      )),
    );
  }
}
