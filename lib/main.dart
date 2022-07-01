
import 'package:admin_panal/page/login_admin.dart';
import 'package:admin_panal/page/manage_products.dart';
import 'package:admin_panal/page/manage_users.dart';
import 'package:flutter/material.dart';

void main()  {
  runApp(const MyApp());
}

 class MyApp extends StatelessWidget {
 const MyApp({Key? key}) : super(key: key);

   
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Panal ',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Manage_UserScreen(),
    );
  }
}
