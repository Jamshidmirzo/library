// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson88_upload_download/blocs/book/bloc/book_bloc.dart';
import 'package:lesson88_upload_download/data/models/book.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class MoreScreen extends StatefulWidget {
  final Book book;
  const MoreScreen({super.key, required this.book});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black)),
              child: Icon(Icons.save_alt_sharp),
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: ZoomTapAnimation(
              onTap: () {
                if (widget.book.isDownloaded) {
                  context
                      .read<BookBloc>()
                      .add(OpenBook(path: widget.book.savePath));
                } else {
                  context.read<BookBloc>().add(DowloadBook(file: widget.book));
                }
              },
              child: Container(
                alignment: Alignment.center,
                width: 500,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "Dowload",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 23),
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topCenter,
            width: double.infinity,
            height: 400,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(widget.book.image),
              ),
            ),
            child: Row(
              children: [
                ZoomTapAnimation(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.all(20),
                    alignment: Alignment.center,
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black,
                        ),
                        color: Colors.white),
                    child: const Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Synopsis',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                ),
                Text(
                  widget.book.description,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
