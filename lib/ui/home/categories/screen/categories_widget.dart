import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/app_constants.dart';
import '../../../../core/resources/strings_Manager.dart';
import '../../../../data/model/category_model.dart';
import '../widgets/category_item.dart';

class CategoriesWidget extends StatelessWidget {
  void Function(CategoryModel) onClick;

  CategoriesWidget({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringsManager.welcome,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => CategoryItem(
                onClick: onClick,
                category: AppConstants.categories[index],
                index: index,
              ),
              separatorBuilder: (context, index) => SizedBox(height: 16.h),
              itemCount: AppConstants.categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
