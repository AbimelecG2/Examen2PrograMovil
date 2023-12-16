import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_examen/providers/book_provider.dart';
import 'book_details_screen.dart';


class BookListScreen extends StatefulWidget {
  @override
  _BookListScreenState createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  @override
  void initState() {
    super.initState();
    // Llama a fetchBooks para cargar los libros
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<BookProvider>(context, listen: false).fetchBooks();
    });
  }

  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<BookProvider>(context);
    
    if (bookProvider.books.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text('Libros de Stephen King')),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Libros de Stephen King')),
      body: ListView.builder(
        itemCount: bookProvider.books.length,
        itemBuilder: (context, index) {
          final book = bookProvider.books[index];
          return ListTile(
            title: Text(book.title),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookDetailsScreen(book: book),
              ),
            ),
          );
        },
      ),
    );
  }
}
