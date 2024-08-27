import 'package:equatable/equatable.dart';

abstract class MessagingState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MessagingInitial extends MessagingState {}

class MessagingLoading extends MessagingState {}

class MessagesLoaded extends MessagingState {
  final List<Map<String, dynamic>> messages;

  MessagesLoaded({required this.messages});

  @override
  List<Object?> get props => [messages];
}

class MessageSent extends MessagingState {}

class MessagingError extends MessagingState {
  final String message;

  MessagingError({required this.message});

  @override
  List<Object?> get props => [message];
}
