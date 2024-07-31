part of 'file_bloc.dart';

final class FileState {
  List<FileModel>? files;
  FileModel? file;
  String? errorMessage;
  bool isLoading;

  FileState({
    this.files,
    this.file,
    this.errorMessage,
    this.isLoading = false,
  });

  FileState copyWith({
    List<FileModel>? files,
    FileModel? file,
    String? errorMessage,
    bool? isLoading,
  }) {
    return FileState(
      files: files ?? this.files,
      file: file ?? this.file,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
