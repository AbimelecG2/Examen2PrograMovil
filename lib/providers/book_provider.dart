import 'package:flutter/material.dart';
import 'package:flutter_examen/models/book.dart';
import 'package:flutter_examen/services/book_service.dart';

class BookProvider with ChangeNotifier {
  final BookService _bookService = BookService();
  List<Book> _books = [];
  bool _isLoading = true;
  String? _error;

  List<Book> get books => _books;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchBooks() async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();
      _books = await _bookService.getBooks();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

