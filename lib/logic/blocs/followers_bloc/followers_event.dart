import 'package:equatable/equatable.dart';

abstract class FollowersEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchFollowersRequested extends FollowersEvent {
  final String userId;

  FetchFollowersRequested({required this.userId});

  @override
  List<Object?> get props => [userId];
}
