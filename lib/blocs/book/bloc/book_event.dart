part of 'book_bloc.dart';

abstract class BookEvent {}

class FetchBooksEvent extends BookEvent {}

class DowloadBook extends BookEvent {
  final Book file;

  DowloadBook({required this.file});
}

class OpenBook extends BookEvent {
  final String path;

  OpenBook({required this.path});
}

class UploadBook extends BookEvent {
  final String path;

  UploadBook({required this.path});
}
