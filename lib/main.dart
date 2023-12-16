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
          primarySwatch: Colors.teal,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('LIBRERIA'),
          ),
          body:
              bookListScreen(), // Ensure bookListScreen is embedded within a Material widget
        ),
      ),
    );
  }
}
