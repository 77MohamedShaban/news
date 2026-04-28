import 'package:News/core/resources/strings_Manager.dart';
import 'package:flutter/material.dart';
import '../../../../core/remote/network/api_manager.dart';
import '../../../../model/sources_response/Source.dart';

class SourcesViewModel extends ChangeNotifier {
  List<Source>? sources;
  bool isLoading = false;
  String? errorMessage;
  String? responseMessage;

  getSources(String selectedCategory) async {
    try {
      errorMessage=null;
      responseMessage=null;
      sources = null;
      isLoading = true;
      notifyListeners();
      var response = await ApiManager.getSources(selectedCategory);
      isLoading = false;
      if (response.status != "error") {
        sources = response.sources;
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
