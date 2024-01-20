import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lorby_neobis/core/consts/app_fonts.dart';
import 'package:lorby_neobis/presentation/widgets/logout_btn.dart';
import 'package:lorby_neobis/resources/resources.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

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
              "С возвращением!",
              style: AppFonts.s24w500,
            ),
            SizedBox(
              height: 8.h,
            ),
            const Text(
              "Lorby - твой личный репетитор",
              style: AppFonts.s20w400,
            ),
            SizedBox(
              height: 66.h,
            ),
            Image.asset(Images.illustration, width: 296.w, height: 314.h,),
            const Spacer(),
            const LogOutBtn(),
            SizedBox(
              height: 44.h,
            ),
          ],
        ),
      )),
    );
  }
}
