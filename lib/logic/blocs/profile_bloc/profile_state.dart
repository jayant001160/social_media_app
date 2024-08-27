import 'package:equatable/equatable.dart';

import '../../../data/models/user_model.dart';

abstract class ProfileState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class UserProfileLoaded extends ProfileState {
  final UserModel user;

  UserProfileLoaded({required this.user});

  @override
  List<Object?> get props => [user];
}

class UserProfileUpdated extends ProfileState {
  final UserModel user;

  UserProfileUpdated({required this.user});

  @override
  List<Object?> get props => [user];
}

class ProfileError extends ProfileState {
  final String message;

  ProfileError({required this.message});

  @override
  List<Object?> get props => [message];
}
