import 'package:News/model/articles_response/Article.dart';
import 'package:News/model/sources_response/Source.dart';
import 'package:flutter/material.dart';
import '../../../../core/remote/network/api_manager.dart';
import '../../../../core/resources/strings_Manager.dart';
import '../../../../core/reusable_component/no_internet.dart';
import 'article_item.dart';

class ArticlesList extends StatefulWidget {
  final Source source;

  const ArticlesList({super.key, required this.source});

  @override
  State<ArticlesList> createState() => _ArticlesListState();
}

class _ArticlesListState extends State<ArticlesList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getArticles(widget.source.id!),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(
            child: NoInternet(
              onClick: () {
                setState(() {});
              },
            ),
          );
        }
        var articleResponse = snapshot.data;
        if (articleResponse?.status == "error") {
          return Center(child: Text(articleResponse?.message ?? ""));
        }
        List<Article> articles = articleResponse?.articles ?? [];
        if (articles.isEmpty) {
          return Center(
            child: Text(
              StringsManager.noArticlesFound,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontSize: 16),
            ),
          );
        }
        return ListView.builder(
          itemBuilder: (context, index) =>
              ArticleItem(article: articles[index]),
          itemCount: articles.length,
        );
      },
    );
  }
}
