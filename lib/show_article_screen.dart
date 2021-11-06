import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ShowArticleScreen extends StatelessWidget {
  final String articleText;
  const ShowArticleScreen({
    required this.articleText,
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap:Navigator.of(context).pop,
            child: const Icon(Icons.keyboard_backspace_sharp)),
      ),
      body: WebView(
        initialUrl: articleText,
      ),
    );
  }
}
