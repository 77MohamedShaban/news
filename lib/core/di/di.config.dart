// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../articles_repo.dart' as _i1047;
import '../../data/data_source/articles/articles_dao.dart' as _i47;
import '../../data/data_source/sources/sources_dao.dart' as _i533;
import '../../data/data_source_impl/articles/articles_api_dao_impl.dart'
    as _i866;
import '../../data/data_source_impl/sources/sources_api_dao_impl.dart' as _i976;
import '../../data/repo_impl/articles/articles_repo_impl.dart' as _i999;
import '../../data/repo_impl/sources/sources_repo_impl.dart' as _i508;
import '../../sources_repo.dart' as _i613;
import '../../ui/home/articles/view_model/articles_view_model.dart' as _i1016;
import '../../ui/home/articles/view_model/sources_view_model.dart' as _i194;
import '../remote/network/api_manager.dart' as _i133;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i133.ApiManager>(() => _i133.ApiManager());
    gh.factory<_i47.ArticlesDao>(
      () => _i866.ArticlesApiDaoImpl(gh<_i133.ApiManager>()),
    );
    gh.factory<_i533.SourcesDao>(
      () => _i976.SourcesApiDaoImpl(gh<_i133.ApiManager>()),
    );
    gh.factory<_i1047.ArticlesRepo>(
      () => _i999.ArticlesRepoImpl(gh<_i47.ArticlesDao>()),
    );
    gh.factory<_i1016.ArticlesViewModel>(
      () => _i1016.ArticlesViewModel(gh<_i1047.ArticlesRepo>()),
    );
    gh.factory<_i613.SourcesRepo>(
      () => _i508.SourcesRepoImpl(gh<_i533.SourcesDao>()),
    );
    gh.factory<_i194.SourcesViewModel>(
      () => _i194.SourcesViewModel(gh<_i613.SourcesRepo>()),
    );
    return this;
  }
}
