import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lorby_neobis/core/consts/app_colors.dart';
import 'package:lorby_neobis/core/consts/app_fonts.dart';

class LogOutBtn extends StatelessWidget {
  const LogOutBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) {
                return IntrinsicWidth(
                  child: AlertDialog.adaptive(
                      title: const Text(
                        "Выйти",
                        style: AppFonts.s20w500,
                      ),
                      content: SizedBox(
                        width: 600.w,
                        child: Text(
                          "Точно выйти?",
                          style: AppFonts.s16w500
                              .copyWith(color: AppColors.mediumDark),
                        ),
                      ),
                      actions: [
                        SizedBox(
                          width: double.infinity,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(
                                width: 311.w,
                                child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12))),
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 13),
                                      child: Text(
                                        "Да, точно",
                                        style: AppFonts.s16w500,
                                      ),
                                    )),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              ElevatedButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Да, точно",
                                    style: AppFonts.s16w500,
                                  )),
                            ],
                          ),
                        )
                      ]),
                );
              });
        },
        child: Text(
          "Выйти",
          style: AppFonts.s16w500.copyWith(color: Colors.black),
        ));
  }
}
