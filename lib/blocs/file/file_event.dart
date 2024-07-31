part of 'file_bloc.dart';

sealed class FileEvent {}

final class GetFiles extends FileEvent {}

final class DownloadFile extends FileEvent {
  final FileModel file;

  DownloadFile({
    required this.file,
  });
}

final class OpenFile extends FileEvent {
  final String path;

  OpenFile({required this.path});
}

final class UploadFile extends FileEvent {
  final String path;

  UploadFile({
    required this.path,
  });
}
