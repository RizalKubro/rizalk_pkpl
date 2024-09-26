import 'package:FLUTTERPROJECT/app/modules/home/views/home_views.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';



class WelcomeScreen extends GetView<WelcomeScreen> {
  const WelcomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: const EdgeInsets.only(top: 70, bottom: 80),
        decoration: const BoxDecoration(
          color: Color(0xFF212325),
          image: DecorationImage(
            image: AssetImage("images/1.png"),
            fit: BoxFit.cover,
            opacity: 0.6,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Menikmati Kopi Terbaik dari Kita",
              style: GoogleFonts.lato(color: Colors.white, fontSize: 30),
            ),
            Column(
              children: [
                SizedBox(height: 80),
                Material(
                  color: Color.fromARGB(255, 183, 105, 56),
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    onTap: () => Get.to(HomeScreen()),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                      decoration: BoxDecoration(),
                      child: Text(
                        "Pesan",
                        style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
