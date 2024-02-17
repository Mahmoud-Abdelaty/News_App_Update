import 'package:dio/dio.dart';
import 'package:news_app/constant/variables.dart';
import 'package:news_app/models/article_model.dart';

class NewsServices {
  final Dio dio;

  NewsServices(this.dio);

  Future<List<ArticleModel>?> getGeneralNews(
      {required String categoryName}) async {
    try {
      Response response = await dio.get(
          'https://newsapi.org/v2/top-headlines?apiKey=$yourApiKey&country=us&category=$categoryName');
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData["articles"];

      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        articlesList.add(ArticleModel.fromJson(article));
      }

      return articlesList;
    } catch (e) {
      return null;
    }
  }
}
