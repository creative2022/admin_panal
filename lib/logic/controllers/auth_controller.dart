import 'dart:html';

import 'package:admin_panal/page/login.dart';
import 'package:admin_panal/routes/routes.dart';
import 'package:admin_panal/widgets/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isvisibilty = false;

  void visibilty() {
    isvisibilty = !isvisibilty;
    update();
  }

  void LoginAdmin({
    required String email,
    required String password,
  }) async {
    try {
      Get.to(Loading());
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.offAllNamed(AppRoutes.home);
    } on FirebaseAuthException catch (error) {
      String message = '';
      if (error.code == 'user-not-found') {
        message =
            ' $email.. لا يوجد لديك حساب بهذا الايميل  انشى حسابك من صفحة انشاء الحساب';
      } else if (error.code == 'wrong-password') {
        message = '!.....كلمة المرور غير صحيحة الرجاء حاول مرة اخرى ';
      } else {
        message = "!..... لا يوجد اتصال باالانترنت";
      }
      Get.back();
      Get.snackbar("Warning", message, snackPosition: SnackPosition.BOTTOM);
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }
}
