import 'package:flutter/material.dart';
import 'package:flutter_examen/screens/book_details_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_examen/providers/book_list_provider.dart';


class BookListScreen extends StatefulWidget {
  @override
  _BookListScreenState createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  @override
  void initState() {
    super.initState();
    
    Provider.of<BookListProvider>(context, listen: false).fetchBooks();
  }

  @override
  Widget build(BuildContext context) {
    var bookListProvider = Provider.of<BookListProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('Library', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.white),
            onPressed: () {
              
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {
              
            },
          ),
        ],
      ),
      body: bookListProvider.books.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: bookListProvider.books.length,
              itemBuilder: (context, index) {
                final book = bookListProvider.books[index];
                return Card(
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                  leading: Image.network(
                   'https://dical.es/modules/ph_simpleblog/featured/78.jpg', 
                   fit: BoxFit.cover,
                    width: 50,
                     height: 50,
                  ),

                    title: Text(book.title),
                    subtitle: Text('By Stephen King '), 
                    trailing: IconButton(
                      icon: Icon(Icons.arrow_forward_ios, color: Colors.black),
                      onPressed: () {
                        Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => BookDetailsScreen(book: book),
                           ),
                      );
                      },
                    ),
                    onTap: () {
                      
                    },
                  ),
                );
              },
            ),
      drawer: Drawer(
        // 
        child: ListView(
          children: [
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),
            ListTile(
              title: Text('Option 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Option 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
