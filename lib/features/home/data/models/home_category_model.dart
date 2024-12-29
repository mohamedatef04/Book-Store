class HomeCategoryModel {
  final String? image;
  final String? title;
  final String? subTitle;
  final String? author;
  final String? previewLink;
  final String? description;

  factory HomeCategoryModel.fromJson(json) {
    return HomeCategoryModel(
      image: json['volumeInfo']['imageLinks']['thumbnail'],
      title: json['volumeInfo']['title'],
      subTitle: json['volumeInfo']['subtitle'],
      author: json['volumeInfo']['authors'][0],
      previewLink: json['volumeInfo']['previewLink'],
      description: json['volumeInfo']['description'],
    );
  }

  HomeCategoryModel(
      {this.image,
      this.title,
      this.subTitle,
      this.author,
      this.previewLink,
      this.description});
}
