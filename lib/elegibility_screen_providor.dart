
import 'package:flutter/material.dart';

class EligibilityScreenProvider extends ChangeNotifier{

  String _message = 'You have not given any input';
  bool _isEligible = false;

  String get message => _message;

  bool get isEligible => _isEligible;

  void checkEligibility(int age){
    if(age >= 18){
     eligible();
    }
    else{
      notEligible();
    }
  }

  void notEligible() {
    _isEligible = false;
    _message = 'you are not eligible to apply for driving license';
    notifyListeners();
  }

  void eligible() {
    _isEligible = true;
    _message = 'you are eligible to apply for driving license';
    notifyListeners();
  }
}

