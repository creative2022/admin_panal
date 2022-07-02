import 'package:admin_panal/page/Manage_ads.dart';
import 'package:admin_panal/page/home.dart';
import 'package:admin_panal/page/manage_products.dart';
import 'package:admin_panal/page/manage_users.dart';
import 'package:admin_panal/page/reports.dart';
import 'package:get/get.dart';




class AppRoutes {
  static const Home = Routes.homeScreen;
  static const Users = Routes.usersScreen;
  static const Ads = Routes.adsScreen;
  static const Reports = Routes.reportScreen;
  static const Product = Routes.productScreen;





static final routes = [
   GetPage(
      name: Routes.homeScreen,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: Routes.usersScreen,
      page: () => Manage_UserScreen(),
    ),
    GetPage(
      name: Routes.reportScreen,
      page: () => ReprtsScreen(),
    ),
    GetPage(
      name: Routes.adsScreen,
      page: () => Manage_AdsScreen(),
    ),
    GetPage(
      name: Routes.productScreen,
      page: () => Manage_ProductsScreen(),
    ),
    
    ];}



class Routes {
static const homeScreen = "/homeScreen";
static const usersScreen = "/usersScreen";
static const reportScreen = "/reportScreen";
static const adsScreen = "/adsScreen";
static const productScreen = "/productScreen";




}