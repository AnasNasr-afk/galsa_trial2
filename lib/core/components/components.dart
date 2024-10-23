

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:galsa_trial2/core/constants/constants.dart';
import 'package:galsa_trial2/core/helpers/shared_pref_helper.dart';

import '../helpers/navigation.dart';
import '../theming/text_styles.dart';

void setUpErrorState (BuildContext context , String error){
  Navigator.pop(context);
  showDialog(context: context,
      builder: (context) =>  AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          textAlign: TextAlign.center,
          error,
          style: TextStyles.font14DarkBlueMedium,
        ),
        actions: [
          TextButton(
            onPressed: (){
              Navigator.pop(context);
            }, child: Text(
            'Got it',
            style: TextStyles.font14BlueSemiBold,
          ),
          ),
        ],
      )
  );
}

void showToast({
  required String text,
  required Color color,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0,
    );

void signOut(BuildContext context, Widget widget) {

  SharedPrefHelper.removeData(Constants.userToken)
      .then((value){
    Navigation.navigateAndFinish(context, widget);
  })
      .catchError((e){
    showToast(text: "Error signing out", color: Colors.red);
  });
  }