import 'package:News/core/remote/network/api_manager.dart';
import 'package:News/data/data_source/sources/sources_dao.dart';
import 'package:News/data/model/sources_response/Sources_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SourcesDao)
class SourcesApiDaoImpl implements SourcesDao {
  ApiManager apiManager;

  SourcesApiDaoImpl(this.apiManager);

  @override
  Future<SourcesResponse> fetchSources(String selectedCategory) {
    return apiManager.getSources(selectedCategory);
  }
}
