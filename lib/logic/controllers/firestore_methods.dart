import 'package:admin_panal/routes/routes.dart';
import 'package:admin_panal/utils/app_colors.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FireStoreController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> deleteProduct(context, String postId, String name) async {
    String res = "حدث خطأ غير متوقع";
    try {
      AwesomeDialog(
        context: context,
        width: 500,
        dialogType: DialogType.QUESTION,
        animType: AnimType.SCALE,
        title: ' هل تريد تأكيد الحذف',
        desc: 'حذف ${name}',
        btnCancelOnPress: () {
          Get.back();
        },
        btnOkOnPress: () async {
          await _firestore.collection('product').doc(postId).delete();
          res = 'تم الحذف بنجاح';
          Get.snackbar(
            'نجاح الحذف',
            res,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        },
      ).show();
    } catch (err) {
      res = err.toString();
      Get.snackbar(
        'Error!',
        res,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
    return res;
  }

  Future<String> deleteUser(context, String uid, String name) async {
    String res = "حدث خطأ غير متوقع";
    try {
      AwesomeDialog(
        context: context,
        width: 500,
        dialogType: DialogType.QUESTION,
        animType: AnimType.SCALE,
        title: ' هل تريد تأكيد الحذف',
        desc: 'حذف ${name}',
        btnCancelOnPress: () {
          Get.back();
        },
        btnOkOnPress: () async {
          await _firestore.collection('users').doc(uid).delete();
          res = 'تم الحذف بنجاح';
          Get.snackbar(
            'نجاح الحذف',
            res,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        },
      ).show();
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}