import 'package:News/articles_repo.dart';
import 'package:News/data/data_source/articles/articles_dao.dart';
import 'package:News/data/model/articles_response/Articles_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ArticlesRepo)
class ArticlesRepoImpl implements ArticlesRepo {
  ArticlesDao articlesDao;
  ArticlesRepoImpl(this.articlesDao);
  @override
  Future<ArticlesResponse> getArticles(String sourceId) {
   return articlesDao.fetchArticles(sourceId);
  }
}