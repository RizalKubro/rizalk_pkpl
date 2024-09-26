import 'package:FLUTTERPROJECT/app/modules/home/controllers/cart.dart';
import 'package:FLUTTERPROJECT/app/modules/home/views/pembayaran.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CartItemScreen extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Keranjang Belanja",
          style: GoogleFonts.kanit(color: Colors.white),
        ),
        backgroundColor:
            Colors.black, // Sesuaikan dengan warna yang Anda inginkan
      ),
      body: Obx(() {
        if (cartController.cartItems.isEmpty) {
          return Center(
            child: Text(
              "Keranjang belanja kosong.",
              style: GoogleFonts.kanit(color: Colors.white),
            ),
          );
        } else {
          return ListView.builder(
            itemCount: cartController.cartItems.length,
            itemBuilder: (context, index) {
              final item = cartController.cartItems[index];
              return ListTile(
                title: Text(
                  item.name,
                  style: GoogleFonts.kanit(color: Colors.white),
                ),
                subtitle: DefaultTextStyle(
                  style: TextStyle(color: Colors.white),
                  child: Text("\Rp${item.price.toStringAsFixed(2)}"),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.white),
                  onPressed: () {
                    // Menghapus item dari keranjang belanja
                    cartController.removeFromCart(item);
                  },
                ),
              );
            },
          );
        }
      }),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total: \Rp. ${cartController.totalCartPrice.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            ElevatedButton(
              onPressed: () => Get.to(Pembayaran(
                totalCartPrice: cartController.totalCartPrice,
                numberOfItemsBought: cartController.cartItems.length,
              )),
              child: Text("Pay", style: TextStyle(fontSize: 16)),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue, // Set the button's text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
