import 'package:bloc/bloc.dart';
import 'package:aware/models/topheadlinesnews/response_top_headlinews_news.dart';
import 'package:aware/repositories/api_repository.dart';

abstract class DataState {}

class DataInitial extends DataState {}

class DataLoading extends DataState {}

class DataSuccess extends DataState {
  final ResponseTopHeadlinesNews data;

  DataSuccess(this.data);
}

class DataFailed extends DataState {
  final String errorMessage;

  DataFailed(this.errorMessage);
}

class DataEvent {}

class HomeBloc extends Bloc<DataEvent, DataState> {
  @override
  DataState get initialState => DataInitial();

  @override
  Stream<DataState> mapEventToState(DataEvent event) async* {
    yield DataLoading();
    final apiRepository = ApiRepository(apiClient: null);

    final data = await apiRepository.fetchTopHeadlinesNews();
    if (data.error == null) {
      yield DataSuccess(data);
    } else {
      yield DataFailed('Failed to fetch data');
    }
  }
}
