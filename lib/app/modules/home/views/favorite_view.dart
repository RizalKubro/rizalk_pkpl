import 'package:FLUTTERPROJECT/app/modules/home/controllers/favorite.dart';
import 'package:FLUTTERPROJECT/app/modules/home/views/bottom_navigator_bar.dart';
import 'package:FLUTTERPROJECT/app/modules/home/views/login.dart';
import 'package:FLUTTERPROJECT/app/provider/client_appwrite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoriteItemsScreen extends StatelessWidget {
  final FavoriteController favoriteController = Get.find<FavoriteController>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: checkUserAuth(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Future hasn't completed yet, return a loading indicator or similar
          return CircularProgressIndicator();
        } else {
          // Future completed
          bool isAuthenticated = snapshot.data ?? false;

          if (!isAuthenticated) {
            return Scaffold(
              body: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(LoginScreen());
                  },
                  child: Text("Login untuk mengakses Favorit"),
                ),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  "Favorite Items",
                  style: GoogleFonts.kanit(color: Colors.white),
                ),
                backgroundColor: Colors.black,
              ),
              body: Obx(() {
                if (favoriteController.favoriteItems.isEmpty) {
                  return Center(
                    child: Text("Belum ada item favorit.",
                        style: GoogleFonts.kanit(color: Colors.white)),
                  );
                } else {
                  return ListView.builder(
                    itemCount: favoriteController.favoriteItems.length,
                    itemBuilder: (context, index) {
                      final item = favoriteController.favoriteItems[index];
                      return ListTile(
                        title: Text(item.name,
                            style: GoogleFonts.kanit(color: Colors.white)),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.white),
                          onPressed: () {
                            favoriteController.removeFavorite(item);
                          },
                        ),
                      );
                    },
                  );
                }
              }),
              bottomNavigationBar: CustomBottomNavigationBar(),
            );
          }
        }
      },
    );
  }
}
