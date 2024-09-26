import 'package:FLUTTERPROJECT/app/modules/home/views/map_page.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Pembayaran extends StatelessWidget {
  final double totalCartPrice;
  final int numberOfItemsBought;

  Pembayaran({required this.totalCartPrice, required this.numberOfItemsBought});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pembayaran"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Total Harga: \Rp. ${totalCartPrice.toStringAsFixed(2)}", style: GoogleFonts.kanit(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
            Text("Jumlah Barang yang Dibeli: $numberOfItemsBought",style: GoogleFonts.kanit(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: ()=> Get.to(AddressPage()),
              child: Text("Lokasi Anda"),
            ),
          ],
        ),
      ),
    );
  }
}
