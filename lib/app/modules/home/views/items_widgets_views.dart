import 'package:FLUTTERPROJECT/app/modules/home/views/add_views.dart';
import 'package:FLUTTERPROJECT/app/modules/home/views/single_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ItemsWidget extends StatefulWidget {
  int activeTabIndex;

  ItemsWidget({required this.activeTabIndex});

  @override
  State<ItemsWidget> createState() => _ItemsWidgetState();
}

class _ItemsWidgetState extends State<ItemsWidget> {
  List<List<String>> img = [
    ['kopi', 'Kopi Hangat', '15.000'],
    ['es kopi', 'Kopi Dingin', '20.000'],
    ['moctail', 'Mocktail', '15.000'],
    ['taro', 'Non Kopi', '25.000'],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      childAspectRatio: (150 / 195),
      children: [
        for (int i = 0; i < img.length; i++)
          if (widget.activeTabIndex == i)
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 13),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFF212325),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 8,
                  )
                ],
              ),
              child: Column(
                children: [
                 InkWell(
  onTap: () {
    double price = double.parse(img[i][2].replaceAll('.', '').replaceAll(',', '.'));
    Get.to(SingleItemScreen(img: img[i][0], price: "Rp ${price.toStringAsFixed(0)}"));
  },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Image.asset(
                        "images/${img[i][0]}.png",
                        width: 120,
                        height: 120,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            img[i][0],
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 1),
                          Text(
                            "Best ${img[i][1]}",
                            style: GoogleFonts.lato(
                              fontSize: 16,
                              color: Colors.white60,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       Text(
  "Rp ${int.parse(img[i][2].replaceAll('.', '')).toStringAsFixed(0)}",
  style: GoogleFonts.playfairDisplay(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  ),
),
                         add(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
      ],
    );
  }
}