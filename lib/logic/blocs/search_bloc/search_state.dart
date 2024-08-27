import 'package:equatable/equatable.dart';

import '../../../data/models/user_model.dart';

abstract class SearchState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchResultsLoaded extends SearchState {
  final List<UserModel> users;

  SearchResultsLoaded({required this.users});

  @override
  List<Object?> get props => [users];
}

class SearchNoResults extends SearchState {}

class SearchError extends SearchState {
  final String message;

  SearchError({required this.message});

  @override
  List<Object?> get props => [message];
}
