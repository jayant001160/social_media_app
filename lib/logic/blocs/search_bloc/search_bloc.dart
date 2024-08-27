import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/search_repository.dart';
import 'search_event.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository searchRepository;

  SearchBloc({required this.searchRepository}) : super(SearchInitial()) {
    on<SearchUsersRequested>(_onSearchUsersRequested);
  }

  void _onSearchUsersRequested(SearchUsersRequested event, Emitter<SearchState> emit) async {
    emit(SearchLoading());
    try {
      final users = await searchRepository.searchUsersByName(event.query);
      if (users.isNotEmpty) {
        emit(SearchResultsLoaded(users: users));
      } else {
        emit(SearchNoResults());
      }
    } catch (e) {
      emit(SearchError(message: e.toString()));
    }
  }
}
