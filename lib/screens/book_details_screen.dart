import 'package:flutter/material.dart';
import 'package:flutter_examen/models/book.dart';

class BookDetailScreen extends StatelessWidget {
  final Book book;
  BookDetailScreen({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Fondo negro
      appBar: AppBar(
        title: Text('Detalle del Libro'),
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Título: ${book.title}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.orange, // Texto naranja
                decoration: TextDecoration.underline,
              ),
            ),
            Text(
              'ID: ${book.id}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                decoration: TextDecoration.underline,
              ),
            ),
            Text(
              'Descripción: ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              book.description,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'VILLANOS:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.red, // Texto rojo
                decoration: TextDecoration.underline,
              ),
            ),
            ...book.villains.map((villain) => Row(
              children: [
                Icon(Icons.heart_broken, color: Colors.yellow),
                SizedBox(width: 5),
                Text(
                  villain['name'] ?? 'Desconocido',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            )).toList(),
          ],
        ),
      ),
    );
  }
}
