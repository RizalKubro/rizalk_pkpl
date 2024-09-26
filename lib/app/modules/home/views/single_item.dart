import 'package:FLUTTERPROJECT/app/modules/home/controllers/cart.dart';
import 'package:FLUTTERPROJECT/app/modules/home/controllers/favorite.dart';
import 'package:FLUTTERPROJECT/app/modules/home/views/bottom_navigator_bar.dart';
import 'package:FLUTTERPROJECT/app/modules/home/views/cart_items.dart';
import 'package:FLUTTERPROJECT/app/modules/home/views/favorite_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class SingleItemScreen extends StatelessWidget {
  final String img;
  final String price;
  final FavoriteController favoriteController = Get.put(FavoriteController());
  final CartController cartController = Get.put(CartController());
  late String cleanedPrice;

  SingleItemScreen({required this.img, required this.price});

  @override
  Widget build(BuildContext context) {
    cleanedPrice = price.replaceAll(RegExp(r'[^\d.]'), '');
    // ignore: unused_local_variable
    // final CartItem item = CartItem(img, double.parse(cleanedPrice));

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 15, bottom: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Center(
                  child: Transform.scale(
                    scale: 0.4,
                    child: Image.asset(
                      "images/$img.png",
                      width: MediaQuery.of(context).size.width / 1.2,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.only(left: 25, right: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "BEST DRINK",
                        style: GoogleFonts.kanit(
                          color: Colors.white.withOpacity(0.4),
                          letterSpacing: 3,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        img,
                        style: GoogleFonts.kanit(
                          fontSize: 30,
                          letterSpacing: 1,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 25),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.all(15),
                              width: 120,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.2),
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    CupertinoIcons.minus,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 15),
                                  Text(
                                    "2",
                                    style: GoogleFonts.kanit(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(width: 15),
                                  Icon(
                                    CupertinoIcons.minus,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              price,
                              style: GoogleFonts.kanit(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Coffe is a major source of antioxidants in the diet.",
                        style: GoogleFonts.kanit(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(0.4),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "Volume:",
                            style: GoogleFonts.kanit(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "60ml",
                            style: GoogleFonts.kanit(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                cartController.addToCart(
                                  CartItem(
                                    name: img,
                                    price: double.parse(cleanedPrice),
                                    quantity: 1,
                                    id: img,
                                    totalPrice: int.parse(
                                        cleanedPrice), // Set the totalPrice based on your logic
                                    timestamp: DateTime
                                        .now(), // Set the timestamp based on your logic
                                  ),
                                );

                                // Show a Snackbar
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                        Text('Item added to the shopping cart'),
                                  ),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 50),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 50, 54, 56),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  "Add to Cart",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                favoriteController.isFavorite.value =
                                    !favoriteController.isFavorite.value;
                                if (favoriteController.isFavorite.value) {
                                  // Menambahkan item ke daftar favorit
                                  final item = FavoriteItem(img, price);
                                  favoriteController.addToFavorite(item);
                                } else {
                                  // Implementasikan logika penghapusan item dari daftar favorit di sini jika diperlukan
                                }
                              },
                              child: Icon(
                                favoriteController.isFavorite.value
                                    ? Icons.favorite
                                    : Icons.favorite_outline,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
