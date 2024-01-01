import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/constant/variables.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/widgets/loading_news_page.dart';
import 'package:news_app/widgets/news_list_view.dart';

class NewsListviewBuilder extends StatefulWidget {
  const NewsListviewBuilder({Key? key, required this.categoryName})
      : super(key: key);

  final String categoryName;
  @override
  State<NewsListviewBuilder> createState() => _NewsListviewBuilderState();
}

class _NewsListviewBuilderState extends State<NewsListviewBuilder> {
  var futureData;
  @override
  void initState() {
    super.initState();
    futureData =
        NewsServices(Dio()).getGeneralNews(categoryName: widget.categoryName);
    isLoaded = true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureData,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            print('w ${snapshot.data}');
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => LoadingPage(),
                childCount: 5,
              ),
            );
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.data == null || snapshot.data! == []) {
              print('E ${snapshot.data}');
              return const SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'No Data Available',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              print('D ${snapshot.data}');
              return NewsListview(
                  articles: snapshot.data! as List<ArticleModel>);
            }
        }
      },
    );
  }
}
