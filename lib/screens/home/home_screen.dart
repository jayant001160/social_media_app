import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/blocs/auth_bloc/auth_bloc.dart';
import '../../logic/blocs/auth_bloc/auth_event.dart';
import 'map_view.dart';
import 'file_drop_overlay.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FileDropOverlay(
      onFilesDropped: (files) {
        // Handle dropped files
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Files dropped: ${files.join(', ')}')),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                context.read<AuthBloc>().add(AuthSignOutRequested());
              },
            ),
          ],
        ),
        body: Column(
          children: [
            const Expanded(
              child: MapView(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Welcome to the Home Screen!',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Drag and drop files onto this screen.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
