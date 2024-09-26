import 'package:FLUTTERPROJECT/app/modules/home/views/pages/news_page.dart';
import 'package:FLUTTERPROJECT/app/modules/home/views/pages/todohome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  TextEditingController addressController = TextEditingController();
  String? confirmedAddress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF212325),
        title: Text(
          'Enter Address',
          style: GoogleFonts.jost(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: addressController,
              decoration: InputDecoration(
                labelText: 'Enter Address',
              ),
              style: GoogleFonts.jost(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final enteredAddress = addressController.text;
                if (enteredAddress.toLowerCase().contains("sengkaling b14")) {
                  // Jika alamat yang dimasukkan mengandung "sengkaling b14," maka alamat dikonfirmasi.
                  setState(() {
                    confirmedAddress = enteredAddress;
                  });
                  // Munculkan pesan pesanan diantar ke alamat pengguna.
                  _showDeliveryConfirmationDialog();
                } else {
                  // Jika alamat tidak sesuai, Anda bisa memberikan pesan kesalahan.
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Alamat Salah'),
                        content: Text('Alamat harus sengkaling b14".'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text(
                'Confirm Address',
                style: GoogleFonts.jost(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () {
                _showtodoScreen();
              },
              child: Text(
                'Catatan untuk Kurir',
                style: GoogleFonts.jost(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            if (confirmedAddress != null) SizedBox(height: 20),
            Text('Confirmed Address:',
                style: GoogleFonts.jost(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            Text(
              confirmedAddress ?? 'No address confirmed yet',
              style: GoogleFonts.jost(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeliveryConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color(0xFF212325),
          title: Center(
              child: Text(
            'Pesanan sedang menuju ke Lokasi',
            style: GoogleFonts.teko(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          )),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                  child: Text(
                      'Sambil Menunggu Pesana Anda tiba di Lokasi Silahkan Baca Berita terkini',
                      style: GoogleFonts.cabin(
                          color: Colors.white, fontSize: 18))),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () {
                  _showNewsScreen(); // Menavigasi ke layar berita ketika tombol ditekan
                },
                child: Text('Baca Berita Terkini'),
              ),
              SizedBox(height: 10),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Tutup dialog konfirmasi pesanan.
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showNewsScreen() {
    Get.to(NewsPage());
  }

  void _showtodoScreen() {
    Get.to(TodoScreen());
  }
}
