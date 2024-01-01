import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/widgets/news_card.dart';

class NewsListview extends StatelessWidget {
  NewsListview({super.key, required this.articles});

  final List<ArticleModel> articles;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => NewsCard(
          articleModel: articles[index],
        ),
        childCount: articles.length,
      ),
    );
  }
}
