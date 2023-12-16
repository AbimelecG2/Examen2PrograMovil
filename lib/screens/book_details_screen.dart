import 'package:flutter/material.dart';
import 'package:flutter_examen/models/book.dart';

class BookDetailsScreen extends StatelessWidget {
  final Book book;

  BookDetailsScreen({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(book.title)),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(book.description),
            SizedBox(height: 10),
            Text('Villains: ${book.villains.join(', ')}'),
          ],
        ),
      ),
    );
  }
}
