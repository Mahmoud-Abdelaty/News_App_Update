// cached network image
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/widgets/webview_screen.dart';

class NewsCard extends StatelessWidget {
  NewsCard({super.key, required this.articleModel});

  final ArticleModel articleModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WebViewScreen(
                      urlNews: articleModel.url ?? '',
                      articleName: articleModel.source!.name ?? '',
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: articleModel.image != null
                  ? Image.network(
                      articleModel.image!,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.fill,
                      errorBuilder: (BuildContext context, Object error,
                              StackTrace? stackTrace) =>
                          Image.asset(
                        'assets/imageNotFound.png',
                      ),
                    )
                  : Image.asset(
                      'assets/imageNotFound.png',
                    ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              articleModel.title == '[Removed]'
                  ? 'Not Found'
                  : articleModel.title ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              articleModel.subTitle == '[Removed]'
                  ? 'Not Found'
                  : articleModel.subTitle ?? '',
              maxLines: 2,
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
