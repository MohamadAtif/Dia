import 'dart:io';
import 'package:diamart_commerce/constants/global_variables.dart';
import 'package:diamart_commerce/features/account/services/account_services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: GlobalVariables.myTealColor,
      content: Text(
        text,
        style: const TextStyle(fontFamily: 'Kanit', color: Colors.white),
      ),
    ),
  );
}

////EXIt Dialog
Future<bool> onBackDialog(BuildContext context) async {
  bool exitApp = await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text(
                'Log Out',
                style: TextStyle(fontFamily: 'Kanit'),
              ),
              content: const Text(
                'Are you want to Log Out?',
                style: TextStyle(fontFamily: 'Kanit'),
              ),
              actions: [
                ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            GlobalVariables.myTealColor)),
                    onPressed: () {
                      AccountServices().logOut(context);
                      // exit(0);
                    },
                    child: Text(
                      'Yes',
                      style: TextStyle(color: Colors.grey.shade300),
                    )),
                ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            GlobalVariables.myTealColor)),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Text('No',
                        style: TextStyle(color: Colors.grey.shade300)))
              ],
            );
          }) ??
      false;
  return exitApp;
}

////EXIt Dialog
Future<bool> onExitDialog(BuildContext context) async {
  bool exitApp = await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text(
                'Exit App',
                style: TextStyle(fontFamily: 'Kanit'),
              ),
              content: const Text(
                'Are you want to Exit App?',
                style: TextStyle(fontFamily: 'Kanit'),
              ),
              actions: [
                ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            GlobalVariables.myTealColor)),
                    onPressed: () {
                      exit(0);
                    },
                    child: Text(
                      'Yes',
                      style: TextStyle(color: Colors.grey.shade300),
                    )),
                ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            GlobalVariables.myTealColor)),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Text('No',
                        style: TextStyle(color: Colors.grey.shade300)))
              ],
            );
          }) ??
      false;
  return exitApp;
}

// Future<bool?> showToast(String toastMsg) {
//   return Fluttertoast.showToast(
//       msg: toastMsg,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.CENTER,
//       timeInSecForIosWeb: 1,
//       backgroundColor: Colors.teal,
//       textColor: Colors.white,
//       fontSize: 16.0);
// }

Future<List<File>> pickImages() async {
  List<File> images = [];
  try {
    var files = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );
    if (files != null && files.files.isNotEmpty) {
      for (int i = 0; i < files.files.length; i++) {
        images.add(File(files.files[i].path!));
      }
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return images;
}
