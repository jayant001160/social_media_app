import 'package:equatable/equatable.dart';

import '../../../data/models/file_model.dart';

abstract class FileState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FileInitial extends FileState {}

class FileLoading extends FileState {}

class FilesLoaded extends FileState {
  final List<FileModel> files;

  FilesLoaded({required this.files});

  @override
  List<Object?> get props => [files];
}

class FileUploaded extends FileState {}

class FileDeleted extends FileState {}

class FileError extends FileState {
  final String message;

  FileError({required this.message});

  @override
  List<Object?> get props => [message];
}
