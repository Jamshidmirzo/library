// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson88_upload_download/blocs/book/bloc/book_bloc.dart';
import 'package:lesson88_upload_download/blocs/book/bloc/book_state.dart';
import 'package:lesson88_upload_download/data/models/book.dart';
import 'package:lesson88_upload_download/ui/widgets/book_widget.dart';
import 'package:lesson88_upload_download/ui/widgets/category.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List categories = ['All', 'Romane', 'Sci-Fi', 'Fantasy', 'Classic'];

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<BookBloc>().add(FetchBooksEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 120,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Image.asset('assets/images/app.png'),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_active,
              size: 30,
            ),
          ),
        ],
      ),
      body: BlocBuilder<BookBloc, BookState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.errorMessage != null) {
            return Center(
              child: Text(state.errorMessage!),
            );
          }
          if (state.books == null || state.books!.isEmpty) {
            return const Center(
              child: Text("Kitoblar mavjud emas"),
            );
          }
          final files = state.books;
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 30,
                    ),
                    suffixIcon: const Icon(
                      Icons.mic_rounded,
                      size: 30,
                    ),
                    labelText: 'Search for books',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (int index = 0; index < categories.length; index++)
                        Categorys(title: categories[index]),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                const Text(
                  'Continue Reading',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 290,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            crossAxisCount: 2),
                    itemCount: files!.length,
                    itemBuilder: (context, index) {
                      final book = files[index];
                      return Container(
                        width: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: BookWidget(book: book),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
