import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  WebViewScreen({super.key, required this.urlNews, required this.articleName});

  String urlNews;
  String articleName;

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(urlNews));
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.amber),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          articleName,
          style: const TextStyle(
            color: Colors.amber,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
