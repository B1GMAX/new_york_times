import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:new_york_times/information.dart';

class ArticleBloc {
  final StreamController<List<Information>> _articleController =
      StreamController<List<Information>>();

  Stream<List<Information>> get articleStream => _articleController.stream;

  void connectionError(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: GestureDetector(
              onTap: Navigator.of(context).pop, child: const Text('Error')),
        );
      },
    );
  }

  Future<void> loadSportsData(String article, BuildContext context) async {
    final response = await get(Uri.parse(
        'https://api.nytimes.com/svc/search/v2/articlesearch.json?fq=news_desk:(%22$article%22)&api-key=HGvqwzsbPSLf1rD5trhZspzWjcLPZh2Y'));
    final List<Information> articleInformation = [];
    if (response.statusCode == 200) {
      final responseBody = response.body;
      final Map<String, dynamic> json = jsonDecode(responseBody);
      final Map<String, dynamic> otvet = json['response'];
      final List<dynamic> docs = otvet['docs'];
      for (int i = 0; i < docs.length; i++) {
        final Map<String, dynamic> map = docs[i];
        final Map<String, dynamic> headline = map['headline'];
        final String mainHeadline = headline['main'];
        final String webUrl = map['web_url'];
        final String date = map['pub_date'];

        articleInformation.add(Information(
          date: date.substring(0,10),
          headline: mainHeadline,
          text: webUrl,
        ));
      }
      _articleController.add(articleInformation);
    } else {
      connectionError(context);
    }
  }
}
