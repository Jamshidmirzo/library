import 'package:get_it/get_it.dart';
import 'package:lesson88_upload_download/blocs/book/bloc/book_bloc.dart';
import 'package:lesson88_upload_download/data/repositories/book_repository.dart';

import '../blocs/export_blocs.dart';
import '../data/repositories/file_repository.dart';

final getIt = GetIt.instance;

void setUp() {
  getIt.registerSingleton(BookRepository());

  getIt.registerSingleton(
    BookBloc(
      bookRepository: getIt.get<BookRepository>(),
    ),
  );

  getIt.registerSingleton(UserBloc());
}
