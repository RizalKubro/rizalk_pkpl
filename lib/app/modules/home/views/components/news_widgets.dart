// news_widget.dart

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsWidget extends StatelessWidget {
  final String? title, image;
  const NewsWidget({Key? key, this.title, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          SizedBox(
            width: 150,
            child: AspectRatio(
              aspectRatio: 4 / 3,
              child: FancyShimmerImage(
                boxFit: BoxFit.cover,
                imageUrl: image ?? '',
              ),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Text(
              title ?? '',
              style: GoogleFonts.kanit(fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
