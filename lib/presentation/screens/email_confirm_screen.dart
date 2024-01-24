import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lorby_neobis/core/consts/app_colors.dart';
import 'package:lorby_neobis/core/consts/app_fonts.dart';
import 'package:lorby_neobis/presentation/bloc/email_confirm_bloc/email_confirm_bloc.dart';
import 'package:lorby_neobis/presentation/bloc/email_confirm_bloc/email_confirm_event.dart';
import 'package:lorby_neobis/presentation/router/app_router.gr.dart';
import 'package:lorby_neobis/presentation/widgets/login_btn.dart';
import 'package:lorby_neobis/presentation/widgets/pin_code.dart';


@RoutePage()
class EmailConfirmScreen extends StatefulWidget {
  const EmailConfirmScreen({super.key});

  @override
  State<EmailConfirmScreen> createState() => _EmailConfirmScreenState();
}

class _EmailConfirmScreenState extends State<EmailConfirmScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller1 = TextEditingController();
    final TextEditingController controller2 = TextEditingController();
    final TextEditingController controller3 = TextEditingController();
    final TextEditingController controller4 = TextEditingController();
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 58, vertical: 60),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Введи 4-значный код, высланный на\nexample@gmail.com",
                  style: AppFonts.s20w500,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 38.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PinCodeField(
                    controller: controller1,
                  ),
                  PinCodeField(
                    controller: controller2,
                  ),
                  PinCodeField(
                    controller: controller3,
                  ),
                  PinCodeField(
                    controller: controller4,
                  ),
                ],
              ),
              const Spacer(),
              Text(
                "Выслать код еще раз через 0:54",
                style: AppFonts.s16w500.copyWith(color: AppColors.timerColor),
              ),
              SizedBox(
                height: 21.h,
              ),
              LoginBtn(onPressed: () {
                BlocProvider.of<EmailConfirmBloc>(context).add(MakeEmailConfirm(
                    confirmationCode: controller1.text +
                        controller2.text +
                        controller3.text +
                        controller4.text));
                context.router.push(const HomeRoute());
                // print(controller1.text+controller2.text+controller3.text+controller4.text);
              }),
            ],
          ),
        ),
      ),
    );
  }
}