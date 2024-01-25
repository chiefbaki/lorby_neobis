import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lorby_neobis/core/consts/app_colors.dart';
import 'package:lorby_neobis/core/consts/app_fonts.dart';
import 'package:lorby_neobis/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:lorby_neobis/presentation/bloc/login_bloc/login_event.dart';
import 'package:lorby_neobis/presentation/bloc/login_bloc/login_state.dart';
import 'package:lorby_neobis/presentation/router/app_router.gr.dart';
import 'package:lorby_neobis/presentation/widgets/create_acc_btn.dart';
import 'package:lorby_neobis/presentation/widgets/login_btn.dart';
import 'package:lorby_neobis/presentation/widgets/login_textfield.dart';
import 'package:lorby_neobis/presentation/widgets/pass_textfield.dart';
import 'package:lorby_neobis/resources/resources.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

bool isVisible = false;
bool isVisibleErrorBlock = false;

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passController = TextEditingController();
@override
  void dispose() {
    
    super.dispose();
    loginController.dispose();
    passController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 68,
                    ),
                    Stack(
                      children: [
                        Center(
                          child: Image.asset(
                            Images.earth,
                            width: 186,
                            height: 194,
                          ),
                        ),
                        Positioned(
                            child: Visibility(
                          visible: isVisibleErrorBlock,
                          child: Container(
                            width: 343,
                            height: 54,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: AppColors.errorColor),
                                borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Неверный логин или пароль",
                                    style: AppFonts.s16w500
                                        .copyWith(color: AppColors.errorColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ))
                      ],
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    const Text(
                      "Вэлком бэк!",
                      style: AppFonts.s24w500,
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    LoginTextField(
                      controller: loginController,
                      hintText: "Введите логин",
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    PassTextField(
                      controller: passController,
                      hintText: "Введите пароль",
                      isVisible: false,
                      onPressed: () {
                        isVisible = !isVisible;
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    BlocListener<LoginBloc, LoginState>(
                      listener: (context, state) {
                        if (state is LoginSuccess) {
                          context.router.replace(const HomeRoute());
                          debugPrint(state.token.refresh);
                        } else if (state is LoginError) {
                          isVisibleErrorBlock = !isVisibleErrorBlock;
                          Timer(const Duration(seconds: 5), () {
                            isVisibleErrorBlock = !isVisibleErrorBlock;
                            setState(() {});
                          });
                          setState(() {});
                        }
                      },
                      child: LoginBtn(
                        onPressed: () async {
                          var bloc = BlocProvider.of<LoginBloc>(context);
                          bloc.add(MakeLoginEvent(
                              username: loginController.text,
                              password: passController.text));
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 41,
                    ),
                    const CreateAccBtn(),
                  ],
                ))),
      ),
    );
  }
}
