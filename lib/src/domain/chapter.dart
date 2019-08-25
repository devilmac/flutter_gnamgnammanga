class Chapter {
  String number;
  double date;
  String title;
  String id;

  Chapter(this.number, this.date, this.title, this.id);

  @override
  String toString() {
    return 'Chapter{number: $number, date: $date, title: $title, id: $id}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Chapter &&
          runtimeType == other.runtimeType &&
          number == other.number &&
          date == other.date &&
          title == other.title &&
          id == other.id;

  @override
  int get hashCode =>
      number.hashCode ^ date.hashCode ^ title.hashCode ^ id.hashCode;
}
