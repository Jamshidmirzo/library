import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:lesson88_upload_download/blocs/book/bloc/book_state.dart';
import 'package:lesson88_upload_download/data/models/book.dart';
import 'package:lesson88_upload_download/data/models/file_model.dart';
import 'package:lesson88_upload_download/data/repositories/book_repository.dart';
import 'package:lesson88_upload_download/services/permission_service.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

part 'book_event.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final BookRepository bookRepository;

  BookBloc({required this.bookRepository}) : super(BookState()) {
    on<FetchBooksEvent>(_onFetchBooks);
    on<DowloadBook>(_onDownload);
    on<OpenBook>(_onOpen);
    on<UploadBook>(_onUpload);
  }

  void _onFetchBooks(FetchBooksEvent event, Emitter<BookState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final books = bookRepository.books;
      emit(state.copyWith(isLoading: false, books: books));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  void _onDownload(
    DowloadBook event,
    Emitter<BookState> emit,
  ) async {
    final file = event.file;
    file.isLoading = true;

    emit(state.copyWith(file: file));

    final dio = Dio();

    if (await PermissionService.requestStoragePermission()) {
      try {
        final fullPath = await _getSavePath(file);

        if (_checkFileExists(fullPath)) {
          add(OpenBook(path: fullPath));
          emit(
            state.copyWith(
              file: state.file!
                ..savePath = fullPath
                ..isLoading = false
                ..isDownloaded = true,
            ),
          );
        } else {
          final response = await dio.download(
            file.url,
            fullPath,
            onReceiveProgress: (count, total) {
              emit(state.copyWith(
                file: state.file!..progress = count / total,
              ));
            },
          );

          print(response);

          emit(
            state.copyWith(
              file: state.file!
                ..savePath = fullPath
                ..isLoading = false
                ..isDownloaded = true,
            ),
          );
        }
      } on DioException catch (e) {
        print("DIO EXCEPTION: ${e.response?.data ?? e.message}");
        emit(
          state.copyWith(
            file: state.file!..isLoading = false,
            errorMessage: e.response?.data ?? e.message,
          ),
        );
      } catch (e) {
        print("GENERAL EXCEPTION: ${e.toString()}");
        emit(
          state.copyWith(
            file: state.file!..isLoading = false,
            errorMessage: e.toString(),
          ),
        );
      }
    } else {
      emit(
        state.copyWith(
          file: state.file!..isLoading = false,
          errorMessage: "Storage permission not granted",
        ),
      );
    }
  }

  void _onUpload(UploadBook event, emit) async {
    try {
      final dio = Dio();

      final file = File(event.path);
      final formData = FormData.fromMap(
        {
          "file": MultipartFile.fromBytes(
            file.readAsBytesSync(),
            filename: "Salom2.pdf",
          ),
        },
      );

      final response = await dio.post(
        "https://api.escuelajs.co/api/v1/files/upload",
        data: formData,
        onSendProgress: (count, total) {
          print("${count / total}% yuborilmoqda");
        },
      );

      print(response.data);
    } on DioException catch (e) {
      print("DIO EXCEPTION: ${e.response?.data ?? e.message}");
    } catch (e) {
      print("GENERAL EXCEPTION: ${e.toString()}");
    }
  }

  void _onOpen(
    OpenBook event,
    Emitter<BookState> emit,
  ) async {
    await OpenFilex.open(event.path);
  }

  bool _checkFileExists(String filePath) {
    final file = File(filePath);
    return file.existsSync();
  }

  Future<String> _getSavePath(Book file) async {
    final savePath = await getApplicationDocumentsDirectory();
    final fileExtension = file.url.split('.').last;
    final fileName = "${file.title}.$fileExtension";
    final fullPath = "${savePath.path}/$fileName";

    return fullPath;
  }
}
