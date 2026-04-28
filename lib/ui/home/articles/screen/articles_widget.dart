import 'package:News/core/reusable_component/no_internet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../model/category_model.dart';
import '../../../../model/sources_response/Source.dart';
import '../view_model/sources_view_model.dart';
import '../widgets/articles_list.dart';

class ArticlesWidget extends StatefulWidget {
  final CategoryModel selectedCategory;

  const ArticlesWidget({super.key, required this.selectedCategory});

  @override
  State<ArticlesWidget> createState() => _ArticlesWidgetState();
}

class _ArticlesWidgetState extends State<ArticlesWidget> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          SourcesViewModel()..getSources(widget.selectedCategory.id),
      child: Consumer<SourcesViewModel>(
        builder: (context, sourceViewModel, child) {
          if (sourceViewModel.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (sourceViewModel.errorMessage != null) {
            return Center(
              child: NoInternet(
                onClick: () {
                  sourceViewModel.getSources(widget.selectedCategory.id);
                },
              ),
            );
          }
          if (sourceViewModel.errorMessage != null) {
            Center(child: Text(sourceViewModel.responseMessage!));
          }
          List<Source> sources = sourceViewModel.sources ?? [];
          return DefaultTabController(
            length: sources.length,
            child: Column(
              spacing: 16.h,
              children: [
                TabBar(
                  labelStyle: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  dividerHeight: 0,
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  tabs: sources
                      .map((source) => Tab(text: source.name))
                      .toList(),
                ),
                Expanded(
                  child: Padding(
                    padding: REdgeInsets.only(left: 16, right: 16),
                    child: TabBarView(
                      children: sources
                          .map((source) => ArticlesList(source: source))
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
