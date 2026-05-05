import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../data/model/articles_response/Articles_response.dart';
import '../../../data/model/sources_response/Sources_response.dart';
@singleton
class ApiManager {

  static Dio dio = Dio(BaseOptions(baseUrl: "https://newsapi.org"));

  Future<SourcesResponse> getSources(String selectedCategory) async {
    var response = await dio.get(
      "/v2/top-headlines/sources",
      queryParameters: {
        "apiKey": "9f4ad1b8e7fc4c0fad595e528c044512",
        "category": selectedCategory,
      },
    );
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(response.data);
    return sourcesResponse;
  }

   Future<ArticlesResponse> getArticles(String sourceId) async {
    var response = await dio.get("/v2/everything",queryParameters: {
      "apiKey": "9f4ad1b8e7fc4c0fad595e528c044512",
      "sources": sourceId,
    });
    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(response.data);
    return articlesResponse;
  }

  static Future<ArticlesResponse> getSearchArticles(String searchText) async {
    var response  =await dio.get("/v2/everything",queryParameters: {
     "apiKey": "9f4ad1b8e7fc4c0fad595e528c044512",
     "q": searchText,
   });
    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(response.data);
    return articlesResponse;
 }


}
