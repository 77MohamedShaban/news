import 'package:News/data/model/sources_response/Source.dart';
import 'package:News/sources_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/remote/network/api_manager.dart';

@injectable
class SourcesViewModel extends Cubit<SourcesState> {
  SourcesRepo sourcesRepo;
  SourcesViewModel(this.sourcesRepo) : super(LoadingState());

  getSources(String category) async {
    try {
      emit(LoadingState());
      var response = await sourcesRepo.getSources(category);
      if (response.status != "error") {
        emit(SuccessState(response.sources??[]));
      } else {
        emit(ErrorResponseState(response.message!));
      }
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}

sealed class SourcesState {}

class LoadingState extends SourcesState {}

class ErrorState extends SourcesState {
  String errorMassage;

  ErrorState(this.errorMassage);
}

class ErrorResponseState extends SourcesState {
  String errorResponseMassage;

  ErrorResponseState(this.errorResponseMassage);
}

class SuccessState extends SourcesState {
  List<Source> sources;

  SuccessState(this.sources);
}
