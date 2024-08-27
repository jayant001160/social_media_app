import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/file_repository.dart';
import 'file_event.dart';
import 'file_state.dart';

class FileBloc extends Bloc<FileEvent, FileState> {
  final FileRepository fileRepository;

  FileBloc({required this.fileRepository}) : super(FileInitial()) {
    on<FetchFilesRequested>(_onFetchFilesRequested);
    on<UploadFileRequested>(_onUploadFileRequested);
    on<DeleteFileRequested>(_onDeleteFileRequested);
  }

  void _onFetchFilesRequested(FetchFilesRequested event, Emitter<FileState> emit) async {
    emit(FileLoading());
    try {
      final files = await fileRepository.fetchFiles();
      emit(FilesLoaded(files: files));
    } catch (e) {
      emit(FileError(message: e.toString()));
    }
  }

  void _onUploadFileRequested(UploadFileRequested event, Emitter<FileState> emit) async {
    emit(FileLoading());
    try {
      await fileRepository.uploadFile(event.file);
      emit(FileUploaded());
      add(FetchFilesRequested()); // Fetch the updated list of files after upload
    } catch (e) {
      emit(FileError(message: e.toString()));
    }
  }

  void _onDeleteFileRequested(DeleteFileRequested event, Emitter<FileState> emit) async {
    emit(FileLoading());
    try {
      await fileRepository.deleteFile(event.fileId);
      emit(FileDeleted());
      add(FetchFilesRequested()); // Fetch the updated list of files after deletion
    } catch (e) {
      emit(FileError(message: e.toString()));
    }
  }
}
