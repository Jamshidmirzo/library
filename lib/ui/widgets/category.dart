import 'package:flutter/material.dart';

class Categorys extends StatelessWidget {
  final String title;
  const Categorys({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: 115,
          height: 45,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
