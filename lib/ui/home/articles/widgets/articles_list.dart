import 'package:News/model/articles_response/Article.dart';
import 'package:News/model/sources_response/Source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/strings_Manager.dart';
import '../../../../core/reusable_component/no_internet.dart';
import '../view_model/articles_view_model.dart';
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
    return ChangeNotifierProvider(
      create: (context) => ArticlesViewModel()..getArticles(widget.source.id!),
      child: Consumer<ArticlesViewModel>(
        builder: (context, articlesViewModel, child) {
          if (articlesViewModel.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (articlesViewModel.errorMessage != null) {
            return Center(
              child: NoInternet(
                onClick: () {
                  articlesViewModel.getArticles(widget.source.id!);
                },
              ),
            );
          }
          if (articlesViewModel.responseMessage != null) {
            Center(child: Text(articlesViewModel.responseMessage!));
          }
          List<Article> articles = articlesViewModel.articles ?? [];
          if (articles.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    StringsManager.noArticlesFound,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16),
                  ),
                  Lottie.asset(AssetsManager.emptyLottie,height: 300.h,width: 300.w),

                ],
              ),
            );
          }
          return ListView.builder(
            itemBuilder: (context, index) =>
                ArticleItem(article: articles[index]),
            itemCount: articles.length,
          );
        },
      ),
    );
  }
}
