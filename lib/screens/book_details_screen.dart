import 'package:flutter/material.dart';
import 'package:flutter_examen/models/book.dart';

class BookDetailsScreen extends StatelessWidget {
  final Book book;

  BookDetailsScreen({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(book.title)),
      body: ListView(
        children: book.villains.map((villain) => ListTile(title: Text(villain.name))).toList(),
      ),
    );
  }
}

