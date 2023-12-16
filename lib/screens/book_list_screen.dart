import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/book_provider.dart';
import 'book_details_screen.dart';

class BookListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<BookProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Library'),
        backgroundColor: Colors.grey[900], // Un color oscuro para el AppBar
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
      body: bookProvider.books.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.separated(
              itemCount: bookProvider.books.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                final book = bookProvider.books[index];
                return ListTile(
                  leading: Image.network(
                      'https://dical.es/modules/ph_simpleblog/featured/78.jpg', 
                      fit: BoxFit.cover,
                      width: 50,
                      height: 50,
                    ),
                  title: Text(book.title),
                  subtitle: Text('by Stephen King'), // Agrega el autor al modelo de libro si es necesario
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
      // ... otras propiedades de Scaffold como drawer si es necesario
    );
  }
}
