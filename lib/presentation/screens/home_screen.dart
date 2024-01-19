import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lorby_neobis/core/consts/app_colors.dart';
import 'package:lorby_neobis/core/consts/app_fonts.dart';
import 'package:lorby_neobis/presentation/widgets/login_textfield.dart';
import 'package:lorby_neobis/presentation/widgets/pass_textfield.dart';
import 'package:lorby_neobis/resources/resources.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

bool isVisible = true;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController loginController = TextEditingController();
    final TextEditingController passController = TextEditingController();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(
                height: 68.h,
              ),
              Image.asset(
                Images.earth,
                width: 186.w,
                height: 194.h,
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
              LoginTextField(controller: loginController),
              SizedBox(
                height: 14.h,
              ),
              PassTextField(
                controller: passController,
              ),
              SizedBox(
                height: 24.h,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 199, 199, 199),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 17),
                      child: Text(
                        "Войти",
                        style: AppFonts.s16w500
                            .copyWith(color: AppColors.mediumDark),
                      ),
                    )),
              ),
              SizedBox(
                height: 41.h,
              ),
              TextButton(
                  onPressed: () {}, child: Text("У меня еще нет аккаунта", style: AppFonts.s16w500.copyWith(color: Colors.black),))
            ],
          ),
        ),
      ),
    );
  }
}
