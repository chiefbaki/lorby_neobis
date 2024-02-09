import 'package:flutter/material.dart';
import 'package:lorby_neobis/core/consts/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ButtonActivity extends ChangeNotifier {
  bool isButtonDisabled = false;
  bool isVisibleErrorBlock = false;
  bool isErrorPinCode = true;

  void changePinCodeBorder() {
    isErrorPinCode = !isErrorPinCode;
    notifyListeners();
  }

  Color setPinCodeBorder() {
    return !isErrorPinCode ? AppColors.errorColor : AppColors.textFieldColor;
  }

  Color setColorOne(String controller) {
    RegExp digitRegex = RegExp(r'.*\d.*');
    if (digitRegex.hasMatch(controller)) {
      return AppColors.successColor;
    }else if(!digitRegex.hasMatch(controller)){
      return AppColors.errorColor;
    }else{
      return AppColors.mediumDark;
    }
  }

  void makeDisabledBtn(){
    isButtonDisabled = !isButtonDisabled;
    notifyListeners();
  }

  Color setDisabledBtn(){
    return isButtonDisabled ? AppColors.black : AppColors.disabledBtnColor;
  }

  void reverseErrorBlock() {
    if (isVisibleErrorBlock) {
      isVisibleErrorBlock = !isVisibleErrorBlock;
    }
  }


  void updatedButtonState() {
    isButtonDisabled = !isButtonDisabled;
    notifyListeners();
  }


  Future<void> setToken({email}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList("token", email);
    notifyListeners();
  }

  Future<void> setEmail({email}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("email", email);
    notifyListeners();
  }

  Future<String> getPrefsData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String emailText = prefs.getString("email") ?? 'error to get email';
    return emailText;
  }


}
