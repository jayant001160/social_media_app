import 'package:equatable/equatable.dart';

abstract class NotificationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchNotificationsRequested extends NotificationEvent {
  final String userId;

  FetchNotificationsRequested({required this.userId});

  @override
  List<Object?> get props => [userId];
}

class MarkNotificationAsReadRequested extends NotificationEvent {
  final String notificationId;
  final String userId;

  MarkNotificationAsReadRequested({required this.notificationId, required this.userId});

  @override
  List<Object?> get props => [notificationId, userId];
}
