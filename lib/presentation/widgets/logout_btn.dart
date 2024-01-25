import 'package:flutter/material.dart';
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
                  child: AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                      insetPadding: EdgeInsets.zero,
                      title: Center(
                        child: Column(
                          children: [
                            const Text(
                              "Выйти",
                              style: AppFonts.s20w500,
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Text(
                              "Точно выйти?",
                              style: AppFonts.s16w500
                                  .copyWith(color: AppColors.mediumDark),
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 16.0, left: 16.0, right: 16.0),
                          child: Column(
                            children: [
                              ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.black,
                                      fixedSize: const Size(311, 50),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 13),
                                    child: Text(
                                      "Да, точно",
                                      style: AppFonts.s16w500,
                                    ),
                                  )),
                              const SizedBox(
                                height: 8,
                              ),
                              ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(311, 50)),
                                  child: const Text(
                                    "Нет, остаться",
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
