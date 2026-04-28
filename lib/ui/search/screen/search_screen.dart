import 'package:News/ui/search/screen/search_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/strings_Manager.dart';
import '../../../core/reusable_component/no_internet.dart';
import '../../home/articles/widgets/article_item.dart';
import '../widgets/search_text_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController searchController;

  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: REdgeInsets.only(right: 16, left: 16, top: 16),
        child: ChangeNotifierProvider(
          create: (context) => SearchViewModel(),
          child: Consumer<SearchViewModel>(
            builder: (context, searchViewModel, child) {
              return SafeArea(
                child: Column(
                  children: [
                    SearchTextField(
                      controller: searchController,
                      onSubmitted: (value) {
                        searchViewModel.getQuery(value);
                        searchViewModel.getSearchArticles();
                      },
                      onClear: () {
                       searchViewModel.resetSearch();
                      },
                    ),
                    SizedBox(height: 16.h),
                    Expanded(child: _buildBody(searchViewModel, context)),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBody(SearchViewModel searchViewModel, BuildContext context) {
    if (searchViewModel.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (searchViewModel.responseMessage != null) {
      return Center(child: Text(searchViewModel.responseMessage!));
    }

    if (searchViewModel.errorMessage != null) {
      return Center(
        child: NoInternet(onClick: () => searchViewModel.getSearchArticles()),
      );
    }

    if (searchViewModel.articles == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              StringsManager.startSearching,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16),
            ),
            Container(
                color: Theme.of(context).colorScheme.secondary,
                child: Lottie.asset(AssetsManager.searchingLottie,height: 300.h,width: 300.w)),
          ],
        ),
      );
    }

    final articles = searchViewModel.articles ?? [];
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
      itemBuilder: (context, index) => ArticleItem(article: articles[index]),
      itemCount: articles.length,
    );
  }
}
