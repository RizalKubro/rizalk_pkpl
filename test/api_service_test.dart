import 'package:FLUTTERPROJECT/app/data/models/top_news_models.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  group('TopNewsModel', () {
    test('fromJson should create a TopNewsModel instance from JSON', () {
      Map<String, dynamic> json = {
        'status': 'ok',
        'totalResults': 1, 
        'articles': [
          {
            'source': {'id': '1', 'name': 'Source Name'},
            'author': 'Author Name',
            'title': 'Article Title',
            'description': 'Article Description',
            'url': 'http://example.com',
            'urlToImage': 'http://example.com/image.jpg',
            'publishedAt': '2023-01-01',
            'content': 'Article Content',
          },

        ],
      };

      TopNewsModel topNews = TopNewsModel.fromJson(json);

      expect(topNews.status, equals('ok'));
      expect(topNews.totalResults, equals(1)); 
      expect(topNews.articles, isNotNull);
      expect(topNews.articles!.length, equals(1));


      expect(topNews.articles![0].author, equals('Author Name'));
      expect(topNews.articles![0].source!.id, equals('1'));

    });

    test('toJson should convert a TopNewsModel instance to JSON', () {
      TopNewsModel topNews = TopNewsModel(
        status: 'ok',
        totalResults: 1,
        articles: [
          Articles(
            source: Source(id: '1', name: 'Source Name'),
            author: 'Author Name',
            title: 'Article Title',
            description: 'Article Description',
            url: 'http://example.com',
            urlToImage: 'http://example.com/image.jpg',
            publishedAt: '2023-01-01',
            content: 'Article Content',
          ),
        ],
      );

      Map<String, dynamic> json = topNews.toJson();

      expect(json['status'], equals('ok'));
      expect(json['totalResults'], equals(1)); 
      expect(json['articles'], isNotNull);
      expect(json['articles'], isA<List>());


      expect(json['articles'][0]['author'], equals('Author Name'));
      expect(json['articles'][0]['source']['id'], equals('1'));

    });
  });

}
