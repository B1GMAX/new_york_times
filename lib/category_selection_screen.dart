import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_york_times/const_variables.dart';
import 'article_selection_screen.dart';

class CategorySelectionScreen extends StatelessWidget {
  const CategorySelectionScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ArticleSelectionScreen(
                      categoryOfArticle: kCategories[index],
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(9),
                child: Container(
                  height: 70,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Center(child: Text(kCategories[index])),
                ),
              ),
            );
          },
          itemCount: kCategories.length,
        ),
      ),
    );
  }
}
