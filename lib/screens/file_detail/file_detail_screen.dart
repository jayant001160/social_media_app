import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/blocs/file_bloc/file_bloc.dart';
import '../../logic/blocs/file_bloc/file_event.dart';
import '../../logic/blocs/file_bloc/file_state.dart';
import '../../data/models/file_model.dart';

class FileDetailScreen extends StatelessWidget {
  final FileModel file;

  const FileDetailScreen({Key? key, required this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(file.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('File Name: ${file.name}', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 10),
            Text('File Size: ${file.size}', style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 10),
            Text('Uploaded At: ${file.uploadedAt}', style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 20),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Implement download functionality here
                  },
                  child: const Text('Download'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    context.read<FileBloc>().add(DeleteFileRequested(fileId: file.id));
                  },
                  child: const Text('Delete'),
                ),
              ],
            ),
            BlocListener<FileBloc, FileState>(
              listener: (context, state) {
                if (state is FileDeleted) {
                  Navigator.of(context).pop(); // Return to the previous screen after deletion
                } else if (state is FileError) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(state.message),
                  ));
                }
              },
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
