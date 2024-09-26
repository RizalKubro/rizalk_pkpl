import 'package:FLUTTERPROJECT/app/modules/home/controllers/cart.dart';
import 'package:FLUTTERPROJECT/app/modules/home/controllers/favorite.dart';
import 'package:FLUTTERPROJECT/app/modules/home/views/home_views.dart';
import 'package:FLUTTERPROJECT/app/modules/home/views/profile_views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final FavoriteController favoriteController = Get.find<FavoriteController>();
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 50,
      decoration: BoxDecoration(
        color: Color(0xFF212325),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => Get.to(HomeScreen()),
            child: Icon(
              Icons.home,
              color: Color(0xFFE57734),
              size: 35,
            ),
          ),
          InkWell(
            onTap: () => Get.toNamed('/favorites'),
            child: Obx(() {
              return Icon(
                favoriteController.isFavorite.value
                    ? Icons.favorite
                    : Icons.favorite_outline,
                color: Colors.white,
                size: 35,
              );
            }),
          ),
          InkWell(
            onTap: () => Get.to(ProfileScreen()),
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: 35,
            ),
          ),
          InkWell(
            onTap: () => Get.toNamed('/cart'),
            child: Obx(() {
              return Icon(
                cartController.isCart.value
                    ? Icons.shopping_cart
                    : Icons.shopping_cart_outlined,
                color: Colors.white,
                size: 35,
              );
            }),
          ),
        ],
      ),
    );
  }
}
