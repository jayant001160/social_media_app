import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/notification_repository.dart';
import 'notification_event.dart';
import 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationRepository notificationRepository;

  NotificationBloc({required this.notificationRepository}) : super(NotificationInitial()) {
    on<FetchNotificationsRequested>(_onFetchNotificationsRequested);
    on<MarkNotificationAsReadRequested>(_onMarkNotificationAsReadRequested);
  }

  void _onFetchNotificationsRequested(FetchNotificationsRequested event, Emitter<NotificationState> emit) async {
    emit(NotificationLoading());
    try {
      final notifications = await notificationRepository.fetchNotifications(event.userId);
      emit(NotificationsLoaded(notifications: notifications));
    } catch (e) {
      emit(NotificationError(message: e.toString()));
    }
  }

  void _onMarkNotificationAsReadRequested(MarkNotificationAsReadRequested event, Emitter<NotificationState> emit) async {
    try {
      await notificationRepository.markNotificationAsRead(event.notificationId);
      add(FetchNotificationsRequested(userId: event.userId)); // Refresh notifications after marking as read
    } catch (e) {
      emit(NotificationError(message: e.toString()));
    }
  }
}
