import 'package:equatable/equatable.dart';

import '../../../data/models/user_model.dart';

abstract class ProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchUserProfileRequested extends ProfileEvent {
  final String userId;

  FetchUserProfileRequested({required this.userId});

  @override
  List<Object?> get props => [userId];
}

class UpdateUserProfileRequested extends ProfileEvent {
  final UserModel user;

  UpdateUserProfileRequested({required this.user});

  @override
  List<Object?> get props => [user];
}
