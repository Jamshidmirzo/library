import 'package:lesson88_upload_download/data/models/book.dart';
import 'package:lesson88_upload_download/data/models/file_model.dart';

final class BookState {
  List<Book>? books;
  Book? file;
  String? errorMessage;
  bool isLoading;

  BookState({
    this.books,
    this.file,
    this.errorMessage,
    this.isLoading = false,
  });

  BookState copyWith({
    List<Book>? books,
    Book? file,
    String? errorMessage,
    bool? isLoading,
  }) {
    return BookState(
      books: books ?? this.books,
      file: file ?? this.file,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
