import 'package:equatable/equatable.dart';

abstract class MessagingEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchMessagesRequested extends MessagingEvent {
  final String chatId;

  FetchMessagesRequested({required this.chatId});

  @override
  List<Object?> get props => [chatId];
}

class SendMessageRequested extends MessagingEvent {
  final String chatId;
  final Map<String, dynamic> message;

  SendMessageRequested({required this.chatId, required this.message});

  @override
  List<Object?> get props => [chatId, message];
}
