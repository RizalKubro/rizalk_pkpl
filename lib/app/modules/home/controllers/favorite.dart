import 'package:FLUTTERPROJECT/app/modules/home/views/favorite_items.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  var isFavorite = false.obs;
  var favoriteItems = <FavoriteItem>[].obs;

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }

  void addToFavorite(FavoriteItem item) {
    favoriteItems.add(item);
  }

  void removeFromFavorite(FavoriteItem item) {
    favoriteItems.remove(item);
  }
  void removeFavorite(FavoriteItem item) {
    favoriteItems.remove(item);
  }
}
