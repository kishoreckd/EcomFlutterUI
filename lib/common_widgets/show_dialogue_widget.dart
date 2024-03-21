import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';



Future<bool?> toast({
  required String message,
  Color? backgroundColor,
  Color? textColor,
  ToastGravity? toastGravity,
  double fontSize = 20.0,
}) {
  Fluttertoast.cancel();
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: toastGravity,
      timeInSecForIosWeb: 3,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: fontSize);
}
