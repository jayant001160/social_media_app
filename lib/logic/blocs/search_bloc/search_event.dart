import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SearchUsersRequested extends SearchEvent {
  final String query;

  SearchUsersRequested({required this.query});

  @override
  List<Object?> get props => [query];
}
