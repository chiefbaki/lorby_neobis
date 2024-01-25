import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lorby_neobis/core/consts/app_colors.dart';
import 'package:lorby_neobis/core/consts/app_fonts.dart';
import 'package:lorby_neobis/presentation/bloc/register_bloc/register_bloc.dart';
import 'package:lorby_neobis/presentation/bloc/register_bloc/register_event.dart';
import 'package:lorby_neobis/presentation/bloc/register_bloc/register_state.dart';
import 'package:lorby_neobis/presentation/router/app_router.gr.dart';
import 'package:lorby_neobis/presentation/screens/login_screen.dart';
import 'package:lorby_neobis/presentation/widgets/login_btn.dart';
import 'package:lorby_neobis/presentation/widgets/login_textfield.dart';
import 'package:lorby_neobis/presentation/widgets/pass_textfield.dart';

@RoutePage()
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  void changeVisibility() {
    isVisible = !isVisible;
  }

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
      body: SingleChildScrollView(
        child: Center(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 54,
                    ),
                    Center(
                        child: Text(
                      "Создать аккаунт Lorby",
                      style: AppFonts.s24w500.copyWith(color: AppColors.black),
                    )),
                    const SizedBox(
                      height: 24,
                    ),
                    LoginTextField(
                        controller: emailController,
                        hintText: "Введи адрес почты"),
                    const SizedBox(
                      height: 14,
                    ),
                    LoginTextField(
                        controller: usernameController,
                        hintText: "Придумай логин"),
                    const SizedBox(
                      height: 14,
                    ),
                    PassTextField(
                        controller: passwordController,
                        hintText: "Создай пароль",
                        isVisible: false,
                        onPressed: changeVisibility),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      height: 80,
                      width: 235,
                      decoration: const BoxDecoration(color: Colors.red),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    PassTextField(
                        controller: passwordConfirmController,
                        hintText: "Повтори пароль",
                        isVisible: false,
                        onPressed: changeVisibility),
                    const SizedBox(
                      height: 24,
                    ),
                    BlocListener<RegisterBloc, RegisterState>(
                      listener: (context, state) {
                        if (state is RegisterSuccess) {
                          context.router.push(const EmailConfirmRoute());
                          debugPrint(state.message.toString());
                        } else if (state is RegisterError) {
                          debugPrint(state.error);
                        }
                      },
                      child: LoginBtn(onPressed: () {
                        BlocProvider.of<RegisterBloc>(context).add(
                            UserRegisterEvent(
                                email: emailController.text,
                                username: usernameController.text,
                                password: passwordController.text,
                                passwordConfirm:
                                    passwordConfirmController.text));
                      }
                          // ignore: cast_from_null_always_fails
                          ),
                    )
                  ],
                ))),
      ),
    );
  }
}
