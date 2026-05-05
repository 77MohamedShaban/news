import 'package:News/data/model/articles_response/Article.dart';
import 'package:News/data/model/sources_response/Source.dart';
import 'package:News/data/repo_impl/articles/articles_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/di/di.dart';
import '../../../../core/remote/network/api_manager.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/strings_Manager.dart';
import '../../../../core/reusable_component/no_internet.dart';
import '../../../../data/data_source_impl/articles/articles_api_dao_impl.dart';
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
    return BlocProvider(
      create: (_) => getIt.get<ArticlesViewModel>()..getArticles(widget.source.id!),
      child: BlocBuilder<ArticlesViewModel, ArticlesState>(
        builder: (context, state) {
          switch (state) {
            case LoadingState():
              // TODO: Handle LoadingState
              return Center(child: CircularProgressIndicator());
            case ErrorState():
              return Center(
                child: NoInternet(
                  onClick: () {
                    BlocProvider.of<ArticlesViewModel>(context)
                        .getArticles(widget.source.id!);
                  },
                ),
              );

            case ResponseErrorState():
              // TODO: Handle ResponseErrorState
              return Center(child: Text(state.responseErrorMassage));
            case SuccessState():
              // TODO: Handle SuccessState
              List<Article> articles = state.articles;
              if (articles.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        StringsManager.noArticlesFound,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(fontSize: 16),
                      ),
                      Lottie.asset(
                        AssetsManager.emptyLottie,
                        height: 300.h,
                        width: 300.w,
                      ),
                    ],
                  ),
                );
              }
              return ListView.builder(
                itemBuilder: (context, index) =>
                    ArticleItem(article: articles[index]),
                itemCount: articles.length,
              );
          }
        },
      ),
    );
  }
}
