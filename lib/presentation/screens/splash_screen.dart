import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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
      context.router.push(const LoginRoute());
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
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Твой личный репетитор",
              style: AppFonts.s20w400,
            ),
            const SizedBox(
              height: 66,
            ),
            Image.asset(Images.illustration),
            const Spacer()
          ],
        ),
      )),
    );
  }
}
