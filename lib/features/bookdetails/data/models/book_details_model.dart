class BookDetailsModel {
  final String title;
  final String subTitle;
  final String author;
  final String previewLink;
  final String description;

  BookDetailsModel(
      {required this.title,
      required this.subTitle,
      required this.author,
      required this.previewLink,
      required this.description});

  factory BookDetailsModel.fromJson(json) {
    return BookDetailsModel(
      title: json['volumeInfo']['title'],
      subTitle: json['volumeInfo']['subtitle'],
      author: json['volumeInfo']['authors'][0],
      previewLink: json['volumeInfo']['previewLink'],
      description: json['volumeInfo']['description'],
    );
  }
}
