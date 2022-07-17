import 'package:admin_panal/logic/controllers/auth_controller.dart';
import 'package:admin_panal/utils/app_colors.dart';
import 'package:admin_panal/utils/my_string.dart';
import 'package:admin_panal/utils/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpAdminScreen extends StatelessWidget {
  SignUpAdminScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final TextEditingController usernameConrtoller = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final controller = Get.put(AuthController());
  var confirmPass;

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
              height: 420,
              width: 350,
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextUtils(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          text: "صفحة إنشاء حساب",
                          color: Colors.cyan,
                          underLine: TextDecoration.none),
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
                                controller: usernameConrtoller,
                                obscureText: false,
                                validator: (value) {
                                  if (value.toString().length <= 2) {
                                    return "يجب أن لا يقل الأسم عن 2 أحرف";
                                  } else if (RegExp(validationName)
                                      .hasMatch(value!)) {
                                    return 'يجب أن لايحتوي الأسم على رقم او رمز';
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.person),
                                  suffixIcon: Text(""),
                                  hintText: "اسم المستخدم",
                                ),
                                keyboardType: TextInputType.text),
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
                                      confirmPass = value;
                                      if (value.toString().length <= 8) {
                                        return "يجب أن لا تقل كملة السر عن 8 أحرف";
                                      } else if (!RegExp(validationPassword)
                                          .hasMatch(value!)) {
                                        return 'يجب أن تحتوي على الاقل حرف ورقم';
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(Icons.lock),
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
                        height: 20,
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                              decoration:
                                  BoxDecoration(color: Colors.grey[200]),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: GetBuilder<AuthController>(
                                  builder: (_) {
                                    return TextFormField(
                                        controller: confirmPasswordController,
                                        obscureText: controller.isvisibilty
                                            ? false
                                            : true,
                                        validator: (Value) {
                                          if (Value != confirmPass) {
                                            return "كلمة السر لا تتطابق";
                                          } else {
                                            return null;
                                          }
                                        },
                                        decoration: InputDecoration(
                                          prefixIcon: const Icon(Icons.lock),
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
                                          hintText: "تأكيد كلمةالمرور",
                                        ),
                                        keyboardType: TextInputType.text);
                                  },
                                ),
                              ))),
                      const SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          decoration: const BoxDecoration(color: Colors.indigo),
                          child: GetBuilder<AuthController>(
                            builder: (_) => TextButton(
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  String email = emailController.text.trim();
                                  String password = passwordController.text;
                                  String username = usernameConrtoller.text;
                                  controller.signUpAdmin(
                                      context: context,
                                      email: email,
                                      password: password,
                                      username: username);
                                }
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextUtils(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      text: " إنشاء حساب",
                                      color: Colors.yellow,
                                      underLine: TextDecoration.none,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
