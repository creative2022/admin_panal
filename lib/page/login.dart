import 'package:admin_panal/utils/app_colors.dart';
import 'package:admin_panal/page/signup.dart';
import 'package:admin_panal/utils/my_string.dart';
import 'package:admin_panal/utils/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../logic/controllers/auth_controller.dart';

class LoginAdminScreen extends StatelessWidget {
  LoginAdminScreen({Key? key}) : super(key: key);
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final controller = Get.put(AuthController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Colors.blue, Colors.indigo.shade600])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            color: Colors.red,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 3),
                        blurRadius: 24)
                  ]),
              height: 400,
              width: 350,
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextUtils(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      text: "LOGIN",
                      color: AppColors.blue,
                      underLine: TextDecoration.none,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.grey[200]),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextFormField(
                              controller: emailController,
                              obscureText: false,
                              validator: (value) {
                                if (value.toString().length <= 2) {
                                  return "يجب أن لا يقل الأيميل عن 8 أحرف";
                                } else if (!RegExp(validationEmail)
                                    .hasMatch(value!)) {
                                  return 'التنسيق غير صحيح';
                                } else {
                                  return null;
                                }
                              },
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                suffixIcon: Text(""),
                                hintText: "الأيميل",
                              ),
                              keyboardType: TextInputType.emailAddress),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.grey[200]),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: GetBuilder<AuthController>(
                            builder: (_) {
                              return TextFormField(
                                  controller: passwordController,
                                  obscureText:
                                      controller.isvisibilty ? false : true,
                                  validator: (value) {
                                    if (value.toString().length <= 8) {
                                      return "يجب أن لا تقل كملة السر عن 8 أحرف";
                                    } else if (!RegExp(validationPassword)
                                        .hasMatch(value!)) {
                                      return 'يجب أن تحتوي على الاقل على حروف وارقام';
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.lock),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        controller.visibilty();
                                      },
                                      icon: controller.isvisibilty
                                          ? const Icon(
                                              Icons.visibility,
                                              color: AppColors.lightblue,
                                            )
                                          : const Icon(
                                              Icons.visibility_off,
                                              color: AppColors.blackshade,
                                            ),
                                    ),
                                    hintText: "كلمةالمرور",
                                  ),
                                  keyboardType: TextInputType.text);
                            },
                            
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        decoration: const BoxDecoration(color: Colors.indigo),
                        child:  GetBuilder<AuthController>(
                              builder: (_) => TextButton(
                          onPressed: () async{ if (formKey.currentState!.validate()) {
                                    String email = emailController.text.trim();
                                    String password = passwordController.text;

                                    controller.LoginAdmin(
                                        email: email, password: password);
                                  }
                                },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextUtils(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  text: "تسجيل الدخول",
                                  color: Colors.yellow,
                                  underLine: TextDecoration.none,
                                ),
                              ],
                            ),
                          ),)
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return  SignUpAdminScreen();
                              }));
                            },
                            child: TextUtils(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                text: "انشاء حساب  ",
                                color: Colors.indigo,
                                underLine: TextDecoration.underline),
                          ),
                         ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
