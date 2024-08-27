import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/blocs/notification_bloc/notification_bloc.dart';
import '../../logic/blocs/notification_bloc/notification_event.dart';
import '../../logic/blocs/notification_bloc/notification_state.dart';
import '../../data/repositories/notification_repository.dart';  // Import the repository

class NotificationScreen extends StatelessWidget {
  final String userId;

  const NotificationScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: BlocProvider(
        create: (context) => NotificationBloc(
          notificationRepository: NotificationRepository(),  // Provide the repository here
        )..add(FetchNotificationsRequested(userId: userId)),
        child: BlocBuilder<NotificationBloc, NotificationState>(
          builder: (context, state) {
            if (state is NotificationLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is NotificationsLoaded) {
              if (state.notifications.isEmpty) {
                return const Center(child: Text('No notifications found.'));
              }
              return ListView.builder(
                itemCount: state.notifications.length,
                itemBuilder: (context, index) {
                  final notification = state.notifications[index];
                  return ListTile(
                    title: Text(notification.title),
                    subtitle: Text(notification.message),
                    trailing: IconButton(
                      icon: Icon(
                        notification.isRead ? Icons.check : Icons.mark_email_read,
                        color: notification.isRead ? Colors.green : Colors.blue,
                      ),
                      onPressed: () {
                        context.read<NotificationBloc>().add(
                          MarkNotificationAsReadRequested(
                            notificationId: notification.id,
                            userId: userId,
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            } else if (state is NotificationError) {
              return Center(child: Text(state.message));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
