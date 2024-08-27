import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/messaging_repository.dart';
import 'messaging_event.dart';
import 'messaging_state.dart';

class MessagingBloc extends Bloc<MessagingEvent, MessagingState> {
  final MessagingRepository messagingRepository;

  MessagingBloc({required this.messagingRepository}) : super(MessagingInitial()) {
    on<FetchMessagesRequested>(_onFetchMessagesRequested);
    on<SendMessageRequested>(_onSendMessageRequested);
  }

  void _onFetchMessagesRequested(FetchMessagesRequested event, Emitter<MessagingState> emit) async {
    emit(MessagingLoading());
    try {
      final messages = await messagingRepository.fetchMessages(event.chatId);
      emit(MessagesLoaded(messages: messages));
    } catch (e) {
      emit(MessagingError(message: e.toString()));
    }
  }

  void _onSendMessageRequested(SendMessageRequested event, Emitter<MessagingState> emit) async {
    emit(MessagingLoading());
    try {
      await messagingRepository.sendMessage(event.chatId, event.message);
      emit(MessageSent());
      add(FetchMessagesRequested(chatId: event.chatId)); // Fetch updated messages after sending
    } catch (e) {
      emit(MessagingError(message: e.toString()));
    }
  }
}
