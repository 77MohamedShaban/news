import 'package:News/ui/home/categories/screen/categories_widget.dart';
import 'package:flutter/material.dart';
import 'package:News/core/resources/strings_Manager.dart';
import 'package:News/ui/home/widgets/home_drawer.dart';

import '../../../core/resources/app_constants.dart';
import '../../../model/category_model.dart';
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
      appBar: AppBar(title: Text(appBarTitle)),
      drawer: HomeDrawer(backHome: backHome),
      body: selectedCategory == null
          ? CategoriesWidget(onClick: chooseCategory)
          : ArticlesWidget(selectedCategory: selectedCategory!,),
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
