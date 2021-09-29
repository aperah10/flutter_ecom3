import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

class AllFormValdation with ChangeNotifier {
  mobileValidator(String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter the Mobile Number';
    }

    return null;
    notifyListeners();
  }

  emailValidator(String? val) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    if (val == null || val.isEmpty) {
      return 'Enter the Email';
    }

    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(val)) {
      return "enter valid email";
    }
  }

  postalCodeValid(String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter the Postal Code';
    }
    String pattern = r"^[1-9][0-9]{5}$";

    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(val)) {
      return "Enter Vaild PostalCode";
    }
  }

  /* -------------------------------------------------------------------------- */
  /*                          // ! ONLY NULL VALIDATORS                         */
  /* -------------------------------------------------------------------------- */
  reqValid(String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is Required';
    }
    return null;
  }

  // ! VALIDATORS FILED WITH NULL VALUE
  emailVal2(String? val) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regex = new RegExp(pattern);
    if (val == null || val.isEmpty) {
    } else if (!regex.hasMatch(val)) {
      return "enter valid email";
    }

    // if (!regex.hasMatch(val!)) {
    //   return "enter valid email";
    // }
  }
}
