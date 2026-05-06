import 'package:News/core/di/di.dart';
import 'package:News/core/reusable_component/no_internet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../data/model/category_model.dart';
import '../../../../data/model/sources_response/Source.dart';
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
    return BlocProvider(
      create: (_) => getIt.get<SourcesViewModel>()..getSources(widget.selectedCategory.id),
      child: BlocBuilder<SourcesViewModel, SourcesState>(
        builder: (context, state) {
          switch (state) {
            case LoadingState():{
              // TODO: Handle LoadingState
              return Center(child: CircularProgressIndicator());
            }
            case ErrorState():{

              // TODO: Handle ErrorState
              return Center(
                child: NoInternet(
                  onClick: () {
                        BlocProvider.of<SourcesViewModel>(context).getSources(widget.selectedCategory.id);
                  },
                ),
              );
            }
            case ErrorResponseState():
              // TODO: Handle ErrorResponseState
              return Center(child: Text(state.errorResponseMassage));
            case SuccessState():
              // TODO: Handle SuccessState
              List<Source> sources = state.sources;
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
          }
        },
      ),
    );
  }
}
