import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lorby_neobis/core/consts/app_colors.dart';
import 'package:lorby_neobis/presentation/provider/btn_activity.dart';
import 'package:provider/provider.dart';

class PinCodeField extends StatelessWidget {
  final TextEditingController controller;
  const PinCodeField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ButtonActivity>(context);
    return Form(
      child: SizedBox(
          width: 56,
          height: 90,
          child: TextFormField(
            controller: controller,
            cursorColor: Colors.black,
            cursorHeight: 10,
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
                debugPrint(value.length.toString());
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
                        BorderSide(color:vm.setPinCodeBorder()),
                    borderRadius: BorderRadius.circular(12)),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: AppColors.textFieldColor),
                    borderRadius: BorderRadius.circular(12))),
          )),
    );
  }
}
