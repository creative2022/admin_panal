import 'package:admin_panal/page/Manage_ads.dart';
import 'package:admin_panal/page/home.dart';
import 'package:admin_panal/page/login.dart';
import 'package:admin_panal/page/manage_products.dart';
import 'package:admin_panal/page/manage_users.dart';
import 'package:admin_panal/page/reports.dart';
import 'package:admin_panal/page/signup.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const home = Routes.homeScreen;
  static const users = Routes.usersScreen;
  static const ads = Routes.adsScreen;
  static const reports = Routes.reportScreen;
  static const product = Routes.productScreen;
  static const login = Routes.loginScreen;
  static const signup = Routes.signupScreen;

  static final routes = [
    GetPage(
      name: Routes.homeScreen,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: Routes.usersScreen,
      page: () => const Manage_UserScreen(),
    ),
    GetPage(
      name: Routes.reportScreen,
      page: () =>  ReprtsScreen(),
    ),
    GetPage(
      name: Routes.adsScreen,
      page: () => Manage_AdsScreen(),
    ),
    GetPage(
      name: Routes.productScreen,
      page: () => Manage_ProductsScreen(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginAdminScreen(),
    ),
    GetPage(
      name: Routes.signupScreen,
      page: () => SignUpAdminScreen(),
    ),
  ];
}

class Routes {
  static const homeScreen = "/homeScreen";
  static const usersScreen = "/usersScreen";
  static const reportScreen = "/reportScreen";
  static const adsScreen = "/adsScreen";
  static const productScreen = "/productScreen";
  static const loginScreen = "/loginScreen";
  static const signupScreen = "/signupScreen";
}
