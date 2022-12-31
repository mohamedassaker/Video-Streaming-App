import 'package:flutter/material.dart';

import 'colors.dart';

InputDecoration buildInputDecoration(context, String text) {
  return InputDecoration(
    label: Text(text,style: TextStyle(color: Theme.of(context).disabledColor)),
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    focusedBorder:OutlineInputBorder(
      borderSide: BorderSide(color: darkBlueColor, width: 2.0),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: darkBlueColor, width: 2.0),
    ),
    hintText: text,
    filled: true,
    fillColor: Theme.of(context).primaryColor,
    hintStyle: TextStyle(color: greenColor),
    focusColor: Colors.white,
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: darkBlueColor, width: 2)
    ),
    border: OutlineInputBorder(
        borderSide: BorderSide(color: darkBlueColor, width: 2)
    ),
    errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: darkBlueColor, width: 2)
    ),
    focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: darkBlueColor, width: 2)
    ),
    suffixStyle: TextStyle(color: greenColor),
    contentPadding: const EdgeInsets.only(left: 14, bottom: 10, top: 10, right: 14),
  );
}
