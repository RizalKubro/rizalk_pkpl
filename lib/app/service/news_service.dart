// services/news_service.dart
import 'package:FLUTTERPROJECT/app/config/api_config.dart';
import 'package:FLUTTERPROJECT/app/data/models/top_news_models.dart';

import 'package:dio/dio.dart';

class NewsService {
  bool isLoading = true;
  TopNewsModel ? resNews;
  final Dio dio = Dio();
  Future<Map<String, dynamic>?> getTopNews() async {
    try {
      final response = await dio.get('$BaseUrl/top-headlines?country=us&apiKey=$ApiKey');
      if (response.statusCode == 200) {
        return response.data;
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}


