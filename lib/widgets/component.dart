import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

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

deleteConfirmation(context, {required String text1, String? text2, function}) =>
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(
                'Are you sure you want to delete ${text1} ${text2 ?? ''}?'),
            actions: [
              Row(
                children: [
                  Expanded(
                      child: defaultButton(
                          function: () {
                            Navigator.pop(context);
                          },
                          text: 'Cancel',
                          background: Colors.grey)),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      child: defaultButton(
                          background: Colors.red,
                          text: 'Delete',
                          function: function)),
                ],
              )
            ],
          );
        });
blockConfirmation(context, {required String text1, String? text2, function}) =>
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title:
                Text('Are you sure you want to block ${text1} ${text2 ?? ''}?'),
            actions: [
              Row(
                children: [
                  Expanded(
                      child: defaultButton(
                          function: () {
                            Navigator.pop(context);
                          },
                          text: 'Cancel',
                          background: Colors.grey)),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      child: defaultButton(
                          background: Colors.red,
                          text: 'block',
                          function: function)),
                ],
              )
            ],
          );
        });
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

