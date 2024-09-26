import 'package:FLUTTERPROJECT/app/modules/home/controllers/news_controllers.dart';
import 'package:FLUTTERPROJECT/app/modules/home/views/components/news_widgets.dart';
import 'package:FLUTTERPROJECT/app/modules/home/views/home_views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

void showPopup() {
  Get.dialog(
    AlertDialog(
      backgroundColor: Color(0xFF212325),
      title: Text(
        'Pesanan Anda Telah Sampai',
        style: TextStyle(
          color: Colors.white, // Warna teks judul
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    content: Text(
      'Terima kasih atas pesanan Anda!',
      style: GoogleFonts.teko(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    actions: [
        TextButton(
          onPressed: () {
            Get.to(HomeScreen());
          },
          child: Text('OK'),
        ),
      ],
  ),
  );
}


  @override
  Widget build(BuildContext context) {
    final NewsController newsController = Get.find();

    // Menunggu selama 10 detik sebelum menampilkan popup pesan
    Future.delayed(const Duration(seconds: 20), () {
      showPopup();
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF212325),
        title: Text('Berita terbaru saat ini'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            // child: IconButton(
            //     onPressed: () => Get.to(Search()), icon: Icon(Icons.search)),
      )],
      ),
      backgroundColor: Colors.white,
      body: Obx(() {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                newsController.isLoading.value
                    ? Center(child: CircularProgressIndicator())
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: newsController.resNews.value.articles
                                ?.map((article) {
                              return NewsWidget(
                                title: article.title ?? '',
                                image: article.urlToImage ?? '',
                              );
                            }).toList() ??
                            [],
                      ),
                // Tambahkan lebih banyak item di bawah ini
                NewsWidget(
                  title: 'Judul Item Lain',
                  image: 'URL Gambar Lain',
                ),
                // Tambahkan lebih banyak item di sini
              ],
            ),
          ),
        );
      }),
    );
  }
}
