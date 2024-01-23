import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lorby_neobis/core/consts/app_colors.dart';

class PinCodeField extends StatelessWidget {
  const PinCodeField({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: SizedBox(
          width: 56.w,
          height: 90.h,
          child: TextFormField(
            cursorColor: Colors.black,
            cursorHeight: 10.w,
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
                print(value.length);
              }
            },
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly
            ],
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.textFieldColor,
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: AppColors.textFieldColor),
                    borderRadius: BorderRadius.circular(12)),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: AppColors.textFieldColor),
                    borderRadius: BorderRadius.circular(12))),
          )),
    );
  }
}
