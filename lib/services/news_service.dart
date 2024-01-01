import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class NewsServices {
  final Dio dio;

  NewsServices(this.dio);

  Future<List<ArticleModel>?> getGeneralNews(
      {required String categoryName}) async {
    try {
      Response response = await dio.get(
          'https://newsapi.org/v2/top-headlines?apiKey=500f21c485414a82a58ea786dd68d504&country=us&category=${categoryName}');
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData["articles"];

      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        ArticleModel articleModel = ArticleModel(
            image: article['urlToImage'],
            subTitle: article['description'],
            title: article['title']);

        articlesList.add(articleModel);
      }
      return articlesList;
    } catch (e) {
      return null;
    }
  }
}
