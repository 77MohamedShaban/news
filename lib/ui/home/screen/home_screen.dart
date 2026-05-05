import 'package:News/core/resources/routes_manager.dart';
import 'package:News/ui/home/categories/screen/categories_widget.dart';
import 'package:flutter/material.dart';
import 'package:News/core/resources/strings_Manager.dart';
import 'package:News/ui/home/widgets/home_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/resources/app_constants.dart';
import '../../../core/resources/assets_manager.dart';
import '../../../data/model/category_model.dart';
import '../articles/screen/articles_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryModel? selectedCategory;

  @override
  Widget build(BuildContext context) {
    String appBarTitle = selectedCategory == null
        ? StringsManager.home
        : AppConstants.categories
              .firstWhere((cat) => cat.id == selectedCategory!.id)
              .title;

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        actions: [
          Padding(
            padding: REdgeInsetsDirectional.only(end: 16),
            child: InkWell(
              onTap: (){
                Navigator.pushNamed(context, RoutesManager.searchRouteName);
              },
              child: SvgPicture.asset(
                AssetsManager.search,
                height: 24.h,
                width: 24.w,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.primary,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: HomeDrawer(backHome: backHome),
      body: selectedCategory == null
          ? CategoriesWidget(onClick: chooseCategory)
          : ArticlesWidget(selectedCategory: selectedCategory!),
    );
  }

  void chooseCategory(CategoryModel newCategory) {
    selectedCategory = newCategory;
    setState(() {});
  }

  backHome() {
    Navigator.pop(context);
    selectedCategory = null;
    setState(() {});
  }
}
