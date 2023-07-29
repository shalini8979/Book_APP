
class book1 {
  final String title;
  final String author;
  final String smallThumbnail;
  final String description;

  book1({
    required this.title,
    required this.author,
    required this.smallThumbnail,
    required this.description,
  });

  factory book1.fromJson(Map<String, dynamic> json) {
    return book1(
      title: json['volumeInfo']['title'] ?? '',
      author: json['volumeInfo']['author'] ?? '',
      smallThumbnail: json['volumeInfo']['imageLinks'] ['smallThumbnail']?? '',
      description: json['volumeInfo']['description'] ?? '',
    );
  }
}


