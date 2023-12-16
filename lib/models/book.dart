class Book {
  final String title;
  final List<Villain> villains;

  Book({required this.title, required this.villains});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['title'] as String,
      villains: (json['villains'] as List)
          .map((villainJson) => Villain.fromJson(villainJson))
          .toList(),
    );
  }
}

class Villain {
  final String name;

  Villain({required this.name});

  factory Villain.fromJson(Map<String, dynamic> json) {
    return Villain(
      name: json['name'] as String,
    );
  }
}
