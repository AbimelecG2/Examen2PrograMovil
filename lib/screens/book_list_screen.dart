import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/book_provider.dart';
import 'book_details_screen.dart';

class BookListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<BookProvider>(context);

    if (bookProvider.isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Library'),
          backgroundColor: Colors.grey[900],
        ),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (bookProvider.error != null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Library'),
          backgroundColor: Colors.grey[900],
        ),
        body: Center(
          child: Text('Error: ${bookProvider.error}'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Library'),
        backgroundColor: Colors.grey[900],
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Acción para agregar un libro
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Acción para mostrar más opciones
            },
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: bookProvider.books.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          final book = bookProvider.books[index];
          return ListTile(
            leading:Image.network(
             'https://upload.wikimedia.org/wikipedia/commons/e/e3/Stephen_King_-_2011_%28cropped%29.jpg', // Asegúrate de cambiar esto por la URL real de la imagen del libro
             fit: BoxFit.cover,
             width: 50,
             height: 50,
              ),

            title: Text(book.title),
            subtitle: Text('by  Stephen King '), // Asegúrate de que el autor sea una propiedad en tu modelo de libro
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailsScreen(book: book),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
