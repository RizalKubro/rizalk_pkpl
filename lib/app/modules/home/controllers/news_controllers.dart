// controllers/news_controller.dart
import 'package:FLUTTERPROJECT/app/data/models/top_news_models.dart';
import 'package:FLUTTERPROJECT/app/service/news_service.dart';
import 'package:get/get.dart';



class NewsController extends GetxController {
  var isLoading = true.obs;
  var resNews = TopNewsModel().obs;

  @override
  void onInit() {
    super.onInit();
    getTopNews();
  }

  void getTopNews() async {
    try {
      isLoading(true);
      var response = await NewsService().getTopNews();
      if (response != null) {
        resNews(TopNewsModel.fromJson(response));
      }
    } finally {
      isLoading(false);
    }
  }
}
