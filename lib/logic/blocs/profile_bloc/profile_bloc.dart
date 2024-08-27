import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/profile_repository.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepository;

  ProfileBloc({required this.profileRepository}) : super(ProfileInitial()) {
    on<FetchUserProfileRequested>(_onFetchUserProfileRequested);
    on<UpdateUserProfileRequested>(_onUpdateUserProfileRequested);
  }

  void _onFetchUserProfileRequested(FetchUserProfileRequested event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    try {
      final user = await profileRepository.fetchUserProfile(event.userId);
      if (user != null) {
        emit(UserProfileLoaded(user: user));
      } else {
        emit(ProfileError(message: "User not found."));
      }
    } catch (e) {
      emit(ProfileError(message: e.toString()));
    }
  }

  void _onUpdateUserProfileRequested(UpdateUserProfileRequested event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    try {
      await profileRepository.updateUserProfile(event.user);
      emit(UserProfileUpdated(user: event.user));
    } catch (e) {
      emit(ProfileError(message: e.toString()));
    }
  }
}
