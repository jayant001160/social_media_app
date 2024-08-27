import 'package:equatable/equatable.dart';
import '../../../data/models/user_model.dart';

abstract class FollowersState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FollowersInitial extends FollowersState {}

class FollowersLoading extends FollowersState {}

class FollowersLoaded extends FollowersState {
  final List<UserModel> followers;

  FollowersLoaded({required this.followers});

  @override
  List<Object?> get props => [followers];
}

class FollowersError extends FollowersState {
  final String message;

  FollowersError({required this.message});

  @override
  List<Object?> get props => [message];
}
