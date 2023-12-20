import 'package:diamart_commerce/constants/global_variables.dart';
import 'package:flutter/material.dart';
// // import 'package:fluttertoast/fluttertoast.dart';
import 'package:toast/toast.dart';

// // showSnack(BuildContext context) {
// //   ScaffoldMessenger.of(context)
// //       .showSnackBar(const SnackBar(content: Text('Success')));
// // }

alertDialogToast(String toastMsg) {
  Toast.show(toastMsg,
      duration: Toast.lengthShort,
      backgroundColor: GlobalVariables.secondaryColor,
      gravity: Toast.center);
}

// // showToast(String toastMsg) {
// //   Fluttertoast.showToast(
// //       msg: toastMsg,
// //       toastLength: Toast.LENGTH_SHORT,
// //       gravity: ToastGravity.CENTER,
// //       timeInSecForIosWeb: 1,
// //       backgroundColor: Colors.teal,
// //       textColor: Colors.white,
// //       fontSize: 16.0);
// // }
