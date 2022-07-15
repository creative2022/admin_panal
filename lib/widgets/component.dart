import 'dart:html';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget customText(context,
        {bool upperCase = true,
        required String text,
        double? fontSize,
        Color? color,
        FontWeight? fontWeight}) =>
    Text(
      upperCase ? text.toUpperCase() : text,
      style: TextStyle(
          fontSize: fontSize ?? 16,
          color: color == null ? Colors.white : color),
    );
    

blockConfirmation(context, {required String text1, String? text2, function}) =>
    AwesomeDialog(
      context: context,
      width: 500,
      dialogType: DialogType.QUESTION,
      animType: AnimType.SCALE,
      title: ' هل تريد تأكيد الحظر',
      desc: 'حظر المستخدم ${text1}',
      btnCancelOnPress: () {
        Get.back();
      },
      btnOkOnPress: () {},
    )..show();

Widget defaultButton(
        {double width = double.infinity,
        Color background = Colors.green,
        @required function,
        @required text,
        bool iconText = false,
        icon,
        radius}) =>
    Container(
      decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.all(Radius.circular(radius ?? 10.0))),
      width: width,
      height: 50,
      child: MaterialButton(
        onPressed: function,
        child: iconText == false
            ? Text(
                text,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              )
            : Icon(icon),
      ),
    );
