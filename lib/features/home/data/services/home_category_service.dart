import 'package:bookly_application/features/home/data/models/home_category_model.dart';
import 'package:dio/dio.dart';

class HomeCategoryService {
  final dio = Dio();
  Future<List<HomeCategoryModel>> getHomeBooks(
      {required String category}) async {
    final responce = await dio
        .get('https://www.googleapis.com/books/v1/volumes?q=$category');

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