
import 'package:admin_panal/page/Manage_ads.dart';
import 'package:admin_panal/page/manage_products.dart';
import 'package:admin_panal/page/manage_users.dart';
import 'package:admin_panal/page/reports.dart';
import 'package:admin_panal/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

   Widget _selectedScreen=Manage_UserScreen();

   currentScreen(item){
    switch(item.route){
      case AppRoutes.Users:
      setState(() {
        _selectedScreen=Manage_UserScreen();
      });
       break;
      case AppRoutes.Ads:
      setState(() {
        _selectedScreen=Manage_AdsScreen();
      });
       break;
      case AppRoutes.Product:
      setState(() {
        _selectedScreen=Manage_ProductsScreen();
      });
       break;
      case AppRoutes.Reports:
      setState(() {
        _selectedScreen=ReprtsScreen();
      });
       break;
      }
      
   }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
       AdminScaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Center(child: const Text('Admin Panel')),),
         sideBar:SideBar(
          items: const [
            AdminMenuItem(
              title: 'ٌإدارة المسستخدمين',
              route: AppRoutes.Users,
              icon: Icons.person,
            ),
            AdminMenuItem(
              title: 'إدارة الحرف',
              route: AppRoutes.Product,
              icon: Icons.production_quantity_limits,
            ),
            AdminMenuItem(
              title: 'ٌإدارة الإعلانات',
              route: AppRoutes.Ads,
              icon: Icons.ads_click

            ),
            AdminMenuItem(
              title: ' التقارير',
              route: AppRoutes.Reports,
              icon: Icons.book
            ),
          ], selectedRoute: AppRoutes.Home,
           onSelected: (item) {
          currentScreen(item);
            }
          
          
        ),  body:_selectedScreen),
    );
  }
}