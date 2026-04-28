import 'package:flutter/material.dart';
import '../../../../core/remote/network/api_manager.dart';
import '../../../../core/resources/strings_Manager.dart';
import '../../../../model/articles_response/Article.dart';

class ArticlesViewModel extends ChangeNotifier {
  List<Article>? articles;
  bool isLoading = false;
  String? errorMessage;
  String? responseMessage;

  getArticles(String sourceId) async {
    try {
      errorMessage = null;
      responseMessage = null;
      articles = null;
      isLoading = true;
      notifyListeners();
      var response = await ApiManager.getArticles(sourceId);
      isLoading = false;
      if (response.status != "error") {
        articles = response.articles;
      } else {
        responseMessage = response.message;
      }
      notifyListeners();
    } catch (e) {
      isLoading = false;
      errorMessage = StringsManager.noInternetConnection;
      notifyListeners();
    }
  }
}
