import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:new_york_times/information.dart';

class ArticleBloc {
  final StreamController<List<Information>> _articleController =
      StreamController<List<Information>>();

  Stream<List<Information>> get articleStream => _articleController.stream;

  List<Information> articleInformation = [];

  Future<void> loadSportsData(String article) async {
    String responseBody;
    Response? response;

    response = await get(Uri.parse(
        'https://api.nytimes.com/svc/search/v2/articlesearch.json?fq=news_desk:(%22$article%22)&api-key=HGvqwzsbPSLf1rD5trhZspzWjcLPZh2Y'));

    if (response.statusCode == 200) {
      responseBody = response.body;
      final Map<String, dynamic> json = jsonDecode(responseBody);
      final Map<String, dynamic> otvet = json['response'];
      final List<dynamic> docs = otvet['docs'];
      for (int i = 0; i < docs.length; i++) {
        final Map<String, dynamic> map = docs[i];
        final String abstract = map['abstract'];
        final String webUrl = map['web_url'];
        final String date = map['pub_date'];

        articleInformation.add(Information(
          date: date.replaceRange(10, 24, ''),
          abstract: abstract,
          text: webUrl,
        ));
      }
    } else {
      print('error');
    }
    _articleController.add(articleInformation);
  }
}
