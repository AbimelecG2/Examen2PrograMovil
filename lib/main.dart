import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_examen/providers/book_list_provider.dart';
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
        title: 'Stephen King Library',
        theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: BookListScreen(),
      ),
    );
  }
}

