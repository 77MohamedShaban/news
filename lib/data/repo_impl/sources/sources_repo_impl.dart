import 'package:News/data/data_source/sources/sources_dao.dart';
import 'package:News/data/model/sources_response/Sources_response.dart';
import 'package:News/sources_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SourcesRepo)
class SourcesRepoImpl implements SourcesRepo {
  SourcesDao sourcesDao;

  SourcesRepoImpl(this.sourcesDao);

  @override
  Future<SourcesResponse> getSources(String selectedCategory) {
    return sourcesDao.fetchSources(selectedCategory);
  }
}
