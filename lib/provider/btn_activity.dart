import 'package:flutter/material.dart';

class ButtonActivity extends ChangeNotifier{
  bool isButtonDisabled = false;
  bool isVisibleErrorBlock = false;
  void callErrorBlock(){
    isVisibleErrorBlock = !isVisibleErrorBlock;
    notifyListeners();
  }
  void updatedButtonState(){
    isButtonDisabled = !isButtonDisabled;
    notifyListeners();
  }
}