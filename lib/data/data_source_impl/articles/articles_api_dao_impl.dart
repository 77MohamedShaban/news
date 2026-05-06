import 'package:News/core/remote/network/api_manager.dart';
import 'package:News/data/data_source/articles/articles_dao.dart';
import 'package:News/data/model/articles_response/Articles_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ArticlesDao)
class ArticlesApiDaoImpl  implements ArticlesDao{
  ApiManager apiManager;
  ArticlesApiDaoImpl(this.apiManager);
  @override
  Future<ArticlesResponse> fetchArticles(String sourceId) {
    return apiManager.getArticles(sourceId);
  }
}