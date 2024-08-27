import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/blocs/messaging_bloc/messaging_bloc.dart';
import '../../logic/blocs/messaging_bloc/messaging_event.dart';
import '../../logic/blocs/messaging_bloc/messaging_state.dart';

class MessagingScreen extends StatefulWidget {
  final String chatId;

  const MessagingScreen({Key? key, required this.chatId}) : super(key: key);

  @override
  _MessagingScreenState createState() => _MessagingScreenState();
}

class _MessagingScreenState extends State<MessagingScreen> {
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<MessagingBloc>().add(FetchMessagesRequested(chatId: widget.chatId));
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<MessagingBloc, MessagingState>(
              builder: (context, state) {
                if (state is MessagingLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is MessagesLoaded) {
                  return ListView.builder(
                    reverse: true, // To show the latest message at the bottom
                    itemCount: state.messages.length,
                    itemBuilder: (context, index) {
                      final message = state.messages[index];
                      return ListTile(
                        title: Text(message['text']),
                        subtitle: Text(message['sender']),
                        // Customize the message bubble here as needed
                      );
                    },
                  );
                } else if (state is MessagingError) {
                  return Center(child: Text(state.message));
                }
                return Container();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: 'Type a message',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    final messageText = _messageController.text.trim();
                    if (messageText.isNotEmpty) {
                      context.read<MessagingBloc>().add(
                        SendMessageRequested(
                          chatId: widget.chatId,
                          message: {
                            'text': messageText,
                            'sender': 'Your Name', // Replace with the actual sender's name
                            'timestamp': DateTime.now().millisecondsSinceEpoch,
                          },
                        ),
                      );
                      _messageController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
