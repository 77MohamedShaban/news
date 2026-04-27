import 'package:News/core/remote/network/api_manager.dart';
import 'package:News/core/reusable_component/no_internet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../model/category_model.dart';
import '../../../../model/sources_response/Source.dart';
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
    return FutureBuilder(
      future: ApiManager.getSources(widget.selectedCategory.id),
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

        var sourcesResponse = snapshot.data;
        if (sourcesResponse?.status == "error") {
          return Center(child: Text(sourcesResponse?.message ?? ""));
        }
        List<Source> sources = sourcesResponse?.sources ?? [];
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
                tabs: sources.map((source) => Tab(text: source.name)).toList(),
              ),
              Expanded(
                child: Padding(
                  padding: REdgeInsets.only(left: 16, right: 16),
                  child: TabBarView(
                    children: sources.map((source) => ArticlesList(source: source,)).toList(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
