import 'dart:io';

import 'package:flutter/material.dart';
import '../../../core/remote/network/api_manager.dart';
import '../../../core/resources/strings_Manager.dart';
import '../../../model/articles_response/Article.dart';

class SearchViewModel extends ChangeNotifier {
  List<Article>? articles;
  bool isLoading = false;
  String? errorMessage;
  String? responseMessage;
  String query = "";

  getSearchArticles() async {
    try {
      if (query.trim().isEmpty) return;
      errorMessage = null;
      responseMessage = null;
      articles = null;
      isLoading = true;
      notifyListeners();
      var response = await ApiManager.getSearchArticles(query);
      isLoading = false;
      if (response.status != "error") {
        articles = response.articles;
      } else {
        responseMessage = response.message;
      }
      notifyListeners();
    } catch (e) {
      isLoading = false;
      if (e is SocketException) {
        errorMessage = StringsManager.noInternetConnection;
      } else {
        errorMessage = e.toString();
      }
      notifyListeners();
    }
  }

  getQuery(String value) {
    query = value;
    notifyListeners();
  }

  void resetSearch() {
    articles = null;
    errorMessage = null;
    responseMessage = null;
    query = "";
    notifyListeners();
  }
}
