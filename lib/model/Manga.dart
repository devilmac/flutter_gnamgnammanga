class Manga {
  final int userId;
  final int id;
  final String title;
  final String body;

  Manga({this.userId, this.id, this.title, this.body});

  factory Manga.fromJson(Map<String, dynamic> json) {
    return Manga(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
