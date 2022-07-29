import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FireStoreController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<String> deleteProduct(context, String id, String name) async {
    String message = "حدث خطأ غير متوقع";
    try {
      AwesomeDialog(
        context: context,
        width: 500,
        dialogType: DialogType.QUESTION,
        animType: AnimType.SCALE,
        title: ' هل تريد تأكيد الحذف',
        desc: 'حذف $name',
        btnCancelOnPress: () {
          Get.back();
        },
        btnOkOnPress: () async {
          await _firestore.collection('product').doc(id).delete();
          message = 'تم الحذف بنجاح';
          Get.snackbar(
            'إشعار تأكيد',
            message,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        },
      ).show();
    } catch (err) {
      message = err.toString();
      Get.snackbar(
        'Error!',
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
    return message;
  }

  Future<String> block_user(context, String id, String name) async {
    String message = "حدث خطأ غير متوقع";
    try {
      AwesomeDialog(
        context: context,
        width: 500,
        dialogType: DialogType.QUESTION,
        animType: AnimType.SCALE,
        title: ' هل تريد تأكيد الحظر',
        desc: 'حظر المستخدم $name',
        btnCancelOnPress: () {
          Get.back();
        },
        btnOkOnPress: () async {
          await _firestore.collection('users').doc(id).update({
            'blocked': "yes",
          });
          message = 'تم الحظر بنجاح';
          Get.snackbar(
            'إشعار تأكيد',
            message,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        },
      ).show();
    } catch (err) {
      message = err.toString();
      Get.snackbar(
        'Error!',
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
    return message;
  }

  Future<String> unblock_user(context, String id, String name) async {
    String message = "حدث خطأ غير متوقع";
    try {
      AwesomeDialog(
        context: context,
        width: 500,
        dialogType: DialogType.QUESTION,
        animType: AnimType.SCALE,
        title: ' هل تريد إلغاء الحظر',
        desc: 'إلغاء حظر المستخدم $name',
        btnCancelOnPress: () {
          Get.back();
        },
        btnOkOnPress: () async {
          await _firestore.collection('users').doc(id).update({
            'blocked': "no",
          });
          message = 'تم إلغاء الحظر بنجاح';
          await Get.snackbar(
            'إشعار تأكيد',
            message,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        },
      ).show();
    } catch (err) {
      message = err.toString();
      Get.snackbar(
        'Error!',
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
    return message;
  }




 
}

