import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../articles_repo.dart';
import '../../../../data/model/articles_response/Article.dart';

@injectable
class ArticlesViewModel extends Cubit<ArticlesState> {
late ArticlesRepo articlesRepo;
  ArticlesViewModel(this.articlesRepo) : super(LoadingState());

  Future<void> getArticles(String sourceId) async {
    try {
      emit(LoadingState());
      var response = await articlesRepo.getArticles(sourceId);
      if (response.message != "error") {
        emit(SuccessState(response.articles ?? []));
      } else {
        emit(ResponseErrorState(response.message!));
      }
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}

sealed class ArticlesState {}

class LoadingState extends ArticlesState {}

class ErrorState extends ArticlesState {
  String errorMassage;

  ErrorState(this.errorMassage);
}

class ResponseErrorState extends ArticlesState {
  String responseErrorMassage;

  ResponseErrorState(this.responseErrorMassage);
}

class SuccessState extends ArticlesState {
  List<Article> articles;

  SuccessState(this.articles);
}
