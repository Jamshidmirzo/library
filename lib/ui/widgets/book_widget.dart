// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lesson88_upload_download/data/models/book.dart';
import 'package:lesson88_upload_download/ui/screens/more_screen.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class BookWidget extends StatelessWidget {
  final Book book;
  const BookWidget({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return MoreScreen(book: book);
            },
          ),
        );
      },
      child: Card(
        elevation: 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 168,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(book.image),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    book.author,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${book.price}',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.arrow_forward_ios_rounded))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
