import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lorby_neobis/core/consts/app_colors.dart';
import 'package:lorby_neobis/core/consts/app_fonts.dart';
import 'package:lorby_neobis/presentation/bloc/email_confirm_bloc/email_confirm_bloc.dart';
import 'package:lorby_neobis/presentation/bloc/email_confirm_bloc/email_confirm_event.dart';
import 'package:lorby_neobis/presentation/bloc/email_confirm_bloc/email_confirm_state.dart';
import 'package:lorby_neobis/presentation/router/app_router.gr.dart';
import 'package:lorby_neobis/presentation/widgets/login_btn.dart';
import 'package:lorby_neobis/presentation/widgets/pin_code.dart';
import 'package:lorby_neobis/provider/btn_activity.dart';
import 'package:provider/provider.dart';

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
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 58, vertical: 60),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FutureProvider(
                      create: (context) =>
                          Provider.of<ButtonActivity>(context, listen: false).getPrefsData(),
                      initialData: "Loading...",
                      child: Consumer<String>(
                        builder: (context, value, child) {
                          return Text(
                            "Введи 4-значный код, высланный на\n$value",
                            style: AppFonts.s20w500,
                            textAlign: TextAlign.center,
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 38,
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
                    style:
                        AppFonts.s16w500.copyWith(color: AppColors.timerColor),
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  BlocListener<EmailConfirmBloc, EmailConfirmState>(
                    listener: (context, state) {
                      if (state is EmailConfirmSuccess) {
                        context.router.push(const HomeRoute());
                        debugPrint(state.message.toString());
                      }
                    },
                    child: LoginBtn(onPressed: () {
                      BlocProvider.of<EmailConfirmBloc>(context).add(
                          MakeEmailConfirm(
                              confirmationCode: controller1.text +
                                  controller2.text +
                                  controller3.text +
                                  controller4.text));
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
