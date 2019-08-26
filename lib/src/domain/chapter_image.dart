class ChapterImage {
  int page;
  String imageUrl;
  int height;
  int width;

  ChapterImage(this.page, this.imageUrl, this.height, this.width);

  @override
  String toString() {
    return 'ChapterImage{page: $page, imageUrl: $imageUrl, height: $height, width: $width}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChapterImage &&
          runtimeType == other.runtimeType &&
          page == other.page &&
          imageUrl == other.imageUrl &&
          height == other.height &&
          width == other.width;

  @override
  int get hashCode =>
      page.hashCode ^ imageUrl.hashCode ^ height.hashCode ^ width.hashCode;
}
