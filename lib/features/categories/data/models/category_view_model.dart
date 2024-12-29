class CategoryViewModel {
  final String image;
  final String title;
  final String? author;

  CategoryViewModel(
      {required this.image, required this.title, required this.author});

  factory CategoryViewModel.fromJson(json) {
    return CategoryViewModel(
      image: json['volumeInfo']['imageLinks']['thumbnail'],
      title: json['volumeInfo']['title'],
      author: json['volumeInfo']['authors'][0],
    );
  }
}
