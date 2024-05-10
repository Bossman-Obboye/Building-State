import 'package:flutter/material.dart';

class EligibilityPage extends ChangeNotifier {
  String _eligibilityMessage = '';
  bool _isEligible = false;

  void checkEligibility(int age) {
    if (age <= 15) {
      _eligibilityMessage = "You are not eligible for citizenship";
      _isEligible = false;
    } else {
      _eligibilityMessage = "You are eligible for citizenship";
      _isEligible = true;
    }

    ChangeNotifier();
  }

  String get eligibleMessage => _eligibilityMessage;
  bool get isEligible => _isEligible;
}
