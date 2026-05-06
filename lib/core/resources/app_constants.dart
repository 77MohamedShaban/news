import '../../data/model/category_model.dart';
import 'strings_Manager.dart';

abstract class AppConstants {
  
  static List<CategoryModel> get categories => [
    CategoryModel(
        title: StringsManager.general, 
        id: "general",
        imagePath: "assets/images/general.png"),
    CategoryModel(
        title: StringsManager.business, 
        id: "business",
        imagePath: "assets/images/business.png"),
    CategoryModel(
        title: StringsManager.sports, 
        id: "sports",
        imagePath: "assets/images/sports.png"),
    CategoryModel(
        title: StringsManager.technology, 
        id: "technology",
        imagePath: "assets/images/technology.png"),
    CategoryModel(
        title: StringsManager.health, 
        id: "health",
        imagePath: "assets/images/health.png"),
    CategoryModel(
        title: StringsManager.science, 
        id: "science",
        imagePath: "assets/images/science.png"),
    CategoryModel(
        title: StringsManager.entertainment, 
        id: "entertainment",
        imagePath: "assets/images/entertainment.png")
  ];
}
