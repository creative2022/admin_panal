import 'package:admin_panal/page/Manage_ads.dart';
import 'package:admin_panal/page/manage_admin.dart';
import 'package:admin_panal/page/manage_products.dart';
import 'package:admin_panal/page/manage_creatives.dart';
import 'package:admin_panal/page/manage_users.dart';
import 'package:admin_panal/page/reports.dart';
import 'package:admin_panal/page/signup.dart';
import 'package:admin_panal/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _selectedScreen =  Manage_CreativeScreen();

  currentScreen(item) {
    switch (item.route) {
      case AppRoutes.cretive:
        setState(() {
          _selectedScreen =  Manage_CreativeScreen();
        });
        break;
      case AppRoutes.ads:
        setState(() {
          _selectedScreen =  Manage_AdsScreen();
        });
        break;
      case AppRoutes.product:
        setState(() {
          _selectedScreen = const Manage_ProductsScreen();
        });
        break;
      case AppRoutes.reports:
        setState(() {
          _selectedScreen = const ReprtsScreen();
        });
        break;
      case AppRoutes.signup:
        setState(() {
          _selectedScreen = SignUpAdminScreen();
        });
        break;
      case AppRoutes.admin:
        setState(() {
          _selectedScreen = const AdminScreen();
        });
        break;
      case AppRoutes.users:
        setState(() {
          _selectedScreen = const Manage_UserScreen();
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AdminScaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Center(child: Text('Admin Panel')),
          ),
          sideBar: SideBar(
              items: const [
                AdminMenuItem(
                  title: 'ٌإدارة الحرفيين',
                  route: AppRoutes.cretive,
                  icon: Icons.person,
                ), AdminMenuItem(
                  title: 'ٌإدارة المستخدمين',
                  route: AppRoutes.users,
                  icon: Icons.person,
                ),
                AdminMenuItem(
                  title: 'إدارة الحرف',
                  route: AppRoutes.product,
                  icon: Icons.production_quantity_limits,
                ),
                AdminMenuItem(
                    title: 'ٌإدارة الإعلانات',
                    route: AppRoutes.ads,
                    icon: Icons.ads_click),
                AdminMenuItem(
                    title: ' التقارير',
                    route: AppRoutes.reports,
                    icon: Icons.book),
                AdminMenuItem(
                    title: 'إنشاء حساب مدير',
                    route: AppRoutes.signup,
                    icon: Icons.account_box),
                AdminMenuItem(
                  title: 'إدارة المدراء',
                  route: AppRoutes.admin,
                  icon: Icons.admin_panel_settings,
                )
              ],
              selectedRoute: AppRoutes.home,
              onSelected: (item) {
                currentScreen(item);
              }),
          body: _selectedScreen),
    );
  }
}
