import 'package:News/data/model/articles_response/Articles_response.dart';

abstract interface class ArticlesRepo {
  Future<ArticlesResponse> getArticles(String sourceId);
}