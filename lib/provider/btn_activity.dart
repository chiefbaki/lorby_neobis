import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ButtonActivity extends ChangeNotifier{
  bool isButtonDisabled = false;
  bool isVisibleErrorBlock = false;

  void callErrorBlock(){
    isVisibleErrorBlock = !isVisibleErrorBlock;
    Future.delayed(const Duration(seconds: 3));
    isVisibleErrorBlock = !isVisibleErrorBlock;
    notifyListeners();
  }
  void reverseErrorBlock(){
    if (isVisibleErrorBlock) {
      isVisibleErrorBlock = !isVisibleErrorBlock;
    }
  }
  void updatedButtonState(){
    isButtonDisabled = !isButtonDisabled;
    notifyListeners();
  }

  Future<void> setEmail({email}) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("email", email);
    notifyListeners();
  }

  Future<String> getPrefsData()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();    
    String emailText = prefs.getString("email") ?? 'error to get email';
    return emailText;
  }
}