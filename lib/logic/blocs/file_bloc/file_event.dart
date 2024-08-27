import 'package:equatable/equatable.dart';

import '../../../data/models/file_model.dart';

abstract class FileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchFilesRequested extends FileEvent {}

class UploadFileRequested extends FileEvent {
  final FileModel file;

  UploadFileRequested({required this.file});

  @override
  List<Object?> get props => [file];
}

class DeleteFileRequested extends FileEvent {
  final String fileId;

  DeleteFileRequested({required this.fileId});

  @override
  List<Object?> get props => [fileId];
}
