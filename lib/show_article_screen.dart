import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ShowArticleScreen extends StatelessWidget {
  final String articleText;
  final String headline;

  const ShowArticleScreen({
    required this.articleText,
    required this.headline,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(headline),
      ),
      body: WebView(
        initialUrl: articleText,
      ),
    );
  }
}
