import 'package:dio/dio.dart';
import 'package:flutter_examen/models/book.dart';

class BookService {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://stephen-king-api.onrender.com/api/books';

  Future<List<Book>> getBooks() async {
    try {
      final response = await _dio.get('https://stephen-king-api.onrender.com/api/books');
      return (response.data as List)
          .map((bookJson) => Book.fromJson(bookJson))
          .toList();
    } catch (e) {
      throw Exception('Error al obtener los libros: $e');
    }
  }
}
