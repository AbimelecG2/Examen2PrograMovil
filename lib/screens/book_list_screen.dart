import 'package:flutter/material.dart';
import 'package:flutter_examen/models/book.dart';
import 'package:flutter_examen/screens/book_details_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_examen/providers/book_provider.dart';

class BookListScreen extends StatefulWidget {
  @override
  _BookListScreenState createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<BookListProvider>(context, listen: false).fetchBook());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Libros de Stephen King'),
        backgroundColor: Colors.orange, // Fondo del título en naranja
      ),
      body: Consumer<BookListProvider>(
        builder: (context, bookListProvider, child) {
          if (bookListProvider.books.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: bookListProvider.books.length,
            itemBuilder: (context, index) {
              final book = bookListProvider.books[index];
              return BookListItem(book: book);
            },
          );
        },
      ),
    );
  }
}

class BookListItem extends StatefulWidget {
  final Book book;

  BookListItem({required this.book});

  @override
  _BookListItemState createState() => _BookListItemState();
}

class _BookListItemState extends State<BookListItem> {
  bool isStarred = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        'https://dical.es/modules/ph_simpleblog/featured/78.jpg', // Imagen por defecto
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ),
      title: Text(
        widget.book.title,
        style: TextStyle(fontWeight: FontWeight.bold), // Título en negrita
      ),
      subtitle: Text(widget.book.description),
      trailing: IconButton(
        icon: Icon(
          isStarred ? Icons.star : Icons.star_border,
          color: isStarred ? Colors.yellow : Colors.grey,
        ),
        onPressed: () {
          setState(() {
            isStarred = !isStarred;
          });
        },
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookDetailScreen(book: widget.book),
          ),
        );
      },
    );
  }
}
