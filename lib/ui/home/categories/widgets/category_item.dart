import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/strings_Manager.dart';
import '../../../../data/model/category_model.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel category;
  int index;
  void Function(CategoryModel) onClick;

  CategoryItem({
    super.key,
    required this.category,
    required this.index,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 200.h,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Stack(
        children: [
          Align(
            alignment: index.isEven
                ? Alignment.centerLeft
                : Alignment.centerRight,
            child: Image.asset(
              category.imagePath,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: index.isEven
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: Padding(
              padding: REdgeInsetsDirectional.only(top: 32.h,end: 16.w ,bottom: 16.h ,start: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      category.title,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium?.copyWith(fontSize: 32.sp),
                    ),
                  ),
                  Directionality(
                    textDirection: index.isEven?TextDirection.ltr:TextDirection.rtl,
                    child: InkWell(
                      onTap: () {
                        onClick(category);
                      },
                      child: Container(
                        padding: REdgeInsetsDirectional.only(
                          start: 16,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.5),
                          borderRadius: BorderRadius.circular(84.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              StringsManager.viewAll,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            SizedBox(width: 20.w),
                            CircleAvatar(
                              backgroundColor: Theme.of(
                                context,
                              ).colorScheme.secondary,
                              radius: 32.r,
                              child: SvgPicture.asset(
                                AssetsManager.arrow,
                                matchTextDirection: true,
                                width: 30.w,
                                height: 30.h,colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.srcIn),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
