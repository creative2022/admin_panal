import 'package:admin_panal/page/login.dart';
import 'package:admin_panal/utils/text_utils.dart';
import 'package:flutter/material.dart';

class SignUpAdminScreen extends StatelessWidget {
  const SignUpAdminScreen({Key? key}) : super(key: key);

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
                  boxShadow:const [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 3),
                        blurRadius: 24)
                  ]),
              height: 420,
              width: 350,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextUtils(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        text: "REGISTRATION",
                        color: Colors.cyan,
                        underLine: TextDecoration.none),
                  const  SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.grey[200]),
                        child:const Padding(
                          padding:  EdgeInsets.only(left: 8.0),
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Username',
                                icon: Icon(Icons.person_outline)),
                          ),
                        ),
                      ),
                    ),
                  const  SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.grey[200]),
                        child:const Padding(
                          padding:  EdgeInsets.only(left: 8.0),
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'email',
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
                        child:const Padding(
                          padding:  EdgeInsets.only(left: 8.0),
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Password',
                                icon: Icon(Icons.lock_open)),
                          ),
                        ),
                      ),
                    ),
                   const SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        decoration:const BoxDecoration(color: Colors.indigo),
                        child: MaterialButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextUtils(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    text: "REGISTER",
                                    color: Colors.yellow,
                                    underLine: TextDecoration.none),
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
                                return LoginAdminScreen();
                              }));
                            },
                            child:TextUtils(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              text: "تسجيل الدخول ",
                              color: Colors.indigo,
                              underLine: TextDecoration.underline),
                           ),
                             TextUtils(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                text: "هل لديك حساب مسبقاَ؟",
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
      ),
    );
  }
}
