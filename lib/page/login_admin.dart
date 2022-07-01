import 'package:admin_panal/utils/app_colors.dart';
import 'package:admin_panal/page/signup_admin.dart';
import 'package:admin_panal/utils/text_utils.dart';
import 'package:flutter/material.dart';

class LoginAdmin_Screen extends StatelessWidget {
final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  // final controller = Get.put(AuthController());
  // final _Key = GlobalKey<FormState>();

   LoginAdmin_Screen({Key? key}) : super(key: key);
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
                        child: TextField(
                          controller: emailController,
                          decoration:const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Email',
                              icon: Icon(Icons.email_outlined)),
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
                      decoration: BoxDecoration(color: Colors.grey[200]),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextField(
                          controller: passwordController,
                          decoration:const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password',
                              icon: Icon(Icons.lock_open)),
                        ),
                      ),
                    ),
                  ),
                const  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextUtils(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            text: "هل نسيت كلمة السر؟",
                            color: AppColors.blackshade,
                            underLine: TextDecoration.underline),
                      ],
                    ),
                  ),
                 const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration:const BoxDecoration(color: Colors.indigo),
                      child: TextButton(
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextUtils(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                text: "LOGIN",
                                color: Colors.yellow,
                                underLine: TextDecoration.none,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                 const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return const SignUpAdmin_Screen();
                            }));
                          },
                          child: TextUtils(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              text: "انشاء حساب  ",
                              color: Colors.indigo,
                              underLine: TextDecoration.underline),
                        ),
                        TextUtils(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            text: "إنشاء حساب مدير ",
                            color: Colors.grey,
                            underLine: TextDecoration.none),
                       
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
