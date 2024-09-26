import 'package:FLUTTERPROJECT/app/modules/home/views/bottom_navigator_bar.dart';
import 'package:FLUTTERPROJECT/app/modules/home/views/cart_view.dart';
import 'package:FLUTTERPROJECT/app/modules/home/views/favorite_view.dart';
import 'package:FLUTTERPROJECT/app/modules/home/views/home_views.dart';
import 'package:FLUTTERPROJECT/app/modules/home/views/map_page.dart';
import 'package:FLUTTERPROJECT/app/modules/home/views/pages/todohome.dart';
import 'package:FLUTTERPROJECT/app/modules/home/views/pembayaran.dart';
import 'package:FLUTTERPROJECT/app/modules/home/views/profile_views.dart';
import 'package:FLUTTERPROJECT/app/modules/home/views/setting_views.dart';

import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/Welcome_views.dart';

part 'app_routes.dart';

class AppPages {
  static var img;

  static var i;

  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const WelcomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(name: '/Welcome', page: () => HomeScreen()),
    GetPage(name: '/Profile', page: () => ProfileScreen()),
    GetPage(name: '/Setting', page: () => SettingsScreen()),
    GetPage(name: '/favorite', page: () => CustomBottomNavigationBar()),
    GetPage(name: '/favorites', page: () => FavoriteItemsScreen()),
    GetPage(name: '/home', page: () => HomeScreen()),
    GetPage(name: '/cart', page: () => CartItemScreen()),
    GetPage(
        name: '/cart_view',
        page: () => Pembayaran(
              totalCartPrice: 0,
              numberOfItemsBought: 0,
            )),
    GetPage(name: '/Pembayaran', page: () => AddressPage()),
    GetPage(name:'/todo', page: ()=> TodoScreen())
  ];
}
