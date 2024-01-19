import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lorby_neobis/core/consts/app_fonts.dart';
import 'package:lorby_neobis/presentation/router/app_router.gr.dart';
import 'package:lorby_neobis/resources/resources.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    rouring();
  }

  void rouring() {
    Future.delayed(const Duration(seconds: 3), () {
      context.router.push(const HomeRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23),
        child: Column(
          children: [
            const Spacer(),
            const Text(
              "Lorby",
              style: AppFonts.s40w500,
            ),
            SizedBox(
              height: 8.h,
            ),
            const Text(
              "Твой личный репетитор",
              style: AppFonts.s20w400,
            ),
            SizedBox(
              height: 66.h,
            ),
            Image.asset(Images.illustration),
            const Spacer()
          ],
        ),
      )),
    );
  }
}
