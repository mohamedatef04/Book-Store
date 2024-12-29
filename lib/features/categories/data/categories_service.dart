import 'package:bookly_application/features/home/data/models/home_category_model.dart';
import 'package:dio/dio.dart';

class CategoriesService {
  final dio = Dio();
  Future<List<HomeCategoryModel>> getCategoriesBooks(
      {required String category}) async {
    final responce = await dio.get(
        'https://www.googleapis.com/books/v1/volumes?filter=full&q=$category');

    Map<String, dynamic> jsonData = responce.data;

    List<dynamic> data = jsonData['items'];

    List<HomeCategoryModel> items = [];

    for (var item in data) {
      items.add(
        HomeCategoryModel.fromJson(item),
      );
    }
    print(items);
    return items;
  }
}
