import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lorby_neobis/core/consts/app_colors.dart';
import 'package:lorby_neobis/core/consts/app_fonts.dart';
import 'package:lorby_neobis/presentation/widgets/create_acc_btn.dart';
import 'package:lorby_neobis/presentation/widgets/login_btn.dart';
import 'package:lorby_neobis/presentation/widgets/login_textfield.dart';
import 'package:lorby_neobis/presentation/widgets/pass_textfield.dart';
import 'package:lorby_neobis/provider/btn_activity.dart';
import 'package:lorby_neobis/resources/resources.dart';
import 'package:provider/provider.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

bool isVisible = true;

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController loginController = TextEditingController();
    final TextEditingController passController = TextEditingController();
    final vm = Provider.of<ButtonActivity>(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(
                height: 68.h,
              ),
              Stack(
                children: [
                  Center(
                    child: Image.asset(
                      Images.earth,
                      width: 186.w,
                      height: 194.h,
                    ),
                  ),
                  Positioned(
                      child: Visibility(
                    visible: vm.isVisibleErrorBlock,
                    child: Container(
                      width: 343.w,
                      height: 54.h,
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
              SizedBox(
                height: 35.h,
              ),
              const Text(
                "Вэлком бэк!",
                style: AppFonts.s24w500,
              ),
              SizedBox(
                height: 28.h,
              ),
              LoginTextField(
                controller: loginController,
                hintText: "Введите логин",
              ),
              SizedBox(
                height: 14.h,
              ),
              PassTextField(
                controller: passController,
                hintText: "Введите пароль",
                isVisible: false,
                onPressed: () {
                  isVisible = !isVisible;
                  setState(() {});
                },
              ),
              SizedBox(
                height: 24.h,
              ),
              LoginBtn(
                onPressed: () {},
              ),
              SizedBox(
                height: 41.h,
              ),
              const CreateAccBtn(),
            ],
          ),
        ),
      ),
    );
  }
}
