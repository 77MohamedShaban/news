import 'package:News/core/resources/strings_Manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../core/resources/UiUtils.dart';
import '../../../../data/model/articles_response/Article.dart';

class ArticleItem extends StatelessWidget {
  final Article article;

  const ArticleItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    timeago.setLocaleMessages('ar', timeago.ArMessages());
    return Column(
      children: [
        InkWell(
          onTap: (){
            UIUtils.showArticleDialog(context, article);
          }
          ,child: Container(
            padding: REdgeInsets.all(8),
            height: 340.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: Theme.of(context).colorScheme.primary),
            ),
            child: Column(
              spacing: 10.h,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(8.r),
                    child: CachedNetworkImage(
                      imageUrl: article.urlToImage ?? "",
                      width: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      errorWidget: (context, url, error) => Center(
                        child: Icon(Icons.error, size: 40.sp, color: Colors.red),
                      ),
                    ),
                  ),
                ),
                Text(
                  article.title ?? "",
                  style: Theme.of(
                    context,
                  ).textTheme.labelMedium?.copyWith(fontSize: 16.sp),
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "${StringsManager.by} : ${article.author ?? ""}",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    Text(
                      timeago.format(DateTime.parse(article.publishedAt ?? ""),
                        locale: context.locale.languageCode,
                      ),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
