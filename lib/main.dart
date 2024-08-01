import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson88_upload_download/blocs/book/bloc/book_bloc.dart';

import 'package:lesson88_upload_download/blocs/file/file_bloc.dart';
import 'package:lesson88_upload_download/services/get_it.dart';
import 'package:lesson88_upload_download/ui/screens/home_screen.dart';

import 'ui/screens/main_screen.dart';

void main() {
  setUp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt.get<BookBloc>(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
