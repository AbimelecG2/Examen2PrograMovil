import 'package:flutter/material.dart';
import 'package:flutter_examen/models/book.dart';
import 'package:flutter_examen/services/book_service.dart';

class BookProvider with ChangeNotifier {
  BookService _bookService = BookService();
  List<Book> _books = [];

  List<Book> get books => _books;

  Future<void> fetchBooks() async {
    _books = await _bookService.getBooks();
    notifyListeners();
  }
}
