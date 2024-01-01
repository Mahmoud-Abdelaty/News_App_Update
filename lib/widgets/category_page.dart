import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_list_view_builder.dart';

class NewsListviewCategoryBuilder extends StatefulWidget {
  NewsListviewCategoryBuilder({Key? key, required this.categoryName})
      : super(key: key);
  String categoryName;

  @override
  State<NewsListviewCategoryBuilder> createState() =>
      _NewsListviewCategoryBuilderState();
}

class _NewsListviewCategoryBuilderState
    extends State<NewsListviewCategoryBuilder> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.categoryName,
            style: const TextStyle(
              color: Colors.amber,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: CustomScrollView(slivers: [
            NewsListviewBuilder(categoryName: widget.categoryName),
          ]),
        ),
      ),
    );
  }
}
