import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_york_times/article_bloc.dart';
import 'package:new_york_times/information.dart';
import 'package:new_york_times/show_article_screen.dart';
import 'package:provider/provider.dart';

class ArticleSelectionScreen extends StatelessWidget {
  final String categoryOfArticle;

  const ArticleSelectionScreen({
    required this.categoryOfArticle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<ArticleBloc>(
        create: (context) =>
            ArticleBloc()..loadSportsData(categoryOfArticle, context),
        builder: (context, child) {
          return Scaffold(
            appBar: AppBar(),
            body: StreamBuilder<List<Information>>(
                stream: context.read<ArticleBloc>().articleStream,
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? ListView.builder(
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ShowArticleScreen(
                                        articleText: snapshot.data![index].text,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: 150,
                                  decoration: const BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      children: [
                                        Text(snapshot.data![index].abstract),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(snapshot.data![index].date),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: snapshot.data!.length,
                        )
                      : const Center(child: CircularProgressIndicator());
                }),
          );
        });
  }
}
