import 'package:flutter/material.dart';
import 'package:flutter_examen/providers/book_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_examen/screens/book_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BookListProvider()),
      ],
      child: MaterialApp(
        title: 'LIBRERIA',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: AppBarTheme(
            color: Colors.brown,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.library_books),
                SizedBox(width: 10),
                Text('LIBRERIA', style: TextStyle(color: Colors.white)), // Aquí se añade el título
              ],
            ),
          ),
          body: BookListScreen(),
        ),
      ),
    );
  }
}


