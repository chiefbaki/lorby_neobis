import 'package:flutter/material.dart';

class PassVisibilityProvider extends ChangeNotifier{
  bool isVisible = true;
  
  void changeVisibility(){
    isVisible = !isVisible;
    notifyListeners();
  }

  IconData iconVisibility(){
    return isVisible ? Icons.visibility_off : Icons.visibility_sharp;
  }
}