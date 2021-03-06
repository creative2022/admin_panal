import 'package:admin_panal/page/Manage_ads.dart';
import 'package:admin_panal/page/add_ads.dart';
import 'package:admin_panal/page/feedback.dart';
import 'package:admin_panal/page/manage_admin.dart';
import 'package:admin_panal/page/manage_products.dart';
import 'package:admin_panal/page/manage_creatives.dart';
import 'package:admin_panal/page/manage_users.dart';
import 'package:admin_panal/page/notifications.dart';
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
  Widget _selectedScreen =  const Manage_CreativeScreen();

  currentScreen(item) {
    switch (item.route) {
      case AppRoutes.cretive:
        setState(() {
          _selectedScreen =  const Manage_CreativeScreen();
        });
        break;
      case AppRoutes.ads:
        setState(() {
          _selectedScreen =  const Manage_AdsScreen();
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
          _selectedScreen = const SignUpAdminScreen();
        });
        break;
      case AppRoutes.admin:
        setState(() {
          _selectedScreen =  AdminScreen();
        });
        break;
      case AppRoutes.users:
        setState(() {
          _selectedScreen =  Manage_UserScreen();
        });
        break;
      case AppRoutes.notification:
        setState(() {
          _selectedScreen =  const NotificationScreen();
        });
        break;
        case AppRoutes.feedback:
        setState(() {
          _selectedScreen =   FeedBackScreen();
        });
        break;
         case AppRoutes.addads:
        setState(() {
          _selectedScreen =   Add_Ads_Screen();
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
                  title: '???????????? ????????????????',
                  route: AppRoutes.cretive,
                  icon: Icons.people
                ), AdminMenuItem(
                  title: '???????????? ????????????????????',
                  route: AppRoutes.users,
                  icon: Icons.person,
                ),
                AdminMenuItem(
                  title: '?????????? ??????????',
                  route: AppRoutes.product,
                  icon: Icons.production_quantity_limits,
                ),
                AdminMenuItem(
                    title: '???????????? ??????????????????',
                    route: AppRoutes.ads,
                    icon: Icons.ads_click),
                     AdminMenuItem(
                    title: '?????????? ??????????????',
                    route: AppRoutes.addads,
                    icon: Icons.ads_click),
                AdminMenuItem(
                    title: ' ????????????????',
                    route: AppRoutes.reports,
                    icon: Icons.book),
                AdminMenuItem(
                    title: '?????????? ???????? ????????',
                    route: AppRoutes.signup,
                    icon: Icons.account_box),
                AdminMenuItem(
                  title: '?????????? ??????????????',
                  route: AppRoutes.admin,
                  icon: Icons.admin_panel_settings,
                ),
                 AdminMenuItem(
                  title: '??????????????????',
                  route: AppRoutes.notification,
                  icon: Icons.notifications_active_outlined,
                ),
                 AdminMenuItem(
                  title: '??????????????',
                  route: AppRoutes.feedback,
                  icon: Icons.feedback
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
