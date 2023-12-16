import 'package:dio/dio.dart';
import 'package:flutter_examen/models/book.dart';

class BookService {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://stephen-king-api.onrender.com';

  Future<List<Book>> getBooks() async {
    try {
      final response = await _dio.get('https://stephen-king-api.onrender.com/api/books');
      return (response.data as List).map((book) => Book.fromJson(book)).toList();
    } catch (e) {
      throw Exception('Error fetching books: $e');
    }
  }
}
