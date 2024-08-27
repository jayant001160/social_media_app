import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/followers_repository.dart';
import 'followers_event.dart';
import 'followers_state.dart';

class FollowersBloc extends Bloc<FollowersEvent, FollowersState> {
  final FollowersRepository followersRepository;

  FollowersBloc({required this.followersRepository}) : super(FollowersInitial()) {
    on<FetchFollowersRequested>(_onFetchFollowersRequested);
  }

  void _onFetchFollowersRequested(FetchFollowersRequested event, Emitter<FollowersState> emit) async {
    emit(FollowersLoading());
    try {
      final followers = await followersRepository.fetchFollowers(event.userId);
      emit(FollowersLoaded(followers: followers));
    } catch (e) {
      emit(FollowersError(message: e.toString()));
    }
  }
}
