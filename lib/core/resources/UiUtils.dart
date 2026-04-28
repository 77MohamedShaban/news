import 'package:News/core/resources/strings_Manager.dart';
import 'package:News/ui/home/articles/widgets/article_details_webview.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../model/articles_response/Article.dart';

abstract final class UIUtils {
  static void showArticleDialog(BuildContext context, Article article) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 0.8.sh),
            child: SingleChildScrollView(
              child: Padding(
                padding: REdgeInsets.all(8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 10.h,
                  children: [
                    ClipRRect(
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
                          child: Icon(
                            Icons.error,
                            size: 40.sp,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      article.description ?? "",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    Divider(
                      color: Theme.of(context).colorScheme.secondary,
                      thickness: 1.h,
                      endIndent: 25.w,
                      indent: 25.w,
                    ),
                    Text(
                      article.content ?? "",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(
                          context,
                        ).colorScheme.secondary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        minimumSize: Size.fromHeight(50.h),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ArticleDetailsWebView(
                              url: article.url ?? "",
                            ),
                          ),
                        );
                      },
                      child: Text(
                        StringsManager.viewFullArticle,
                        style: Theme.of(
                          context,
                        ).textTheme.labelMedium?.copyWith(fontSize: 16),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Text(
                            "${StringsManager.by} : ${article.author ?? ""}",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              timeago.format(
                                DateTime.parse(article.publishedAt ?? ""),
                                locale: context.locale.languageCode,
                              ),
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
