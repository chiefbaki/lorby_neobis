import 'package:flutter/material.dart';

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
}