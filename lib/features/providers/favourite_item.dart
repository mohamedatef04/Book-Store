import 'package:bookly_application/features/home/data/models/home_category_model.dart';
import 'package:flutter/cupertino.dart';

class FavouriteItem extends ChangeNotifier {
  List<HomeCategoryModel> items = [];

  addItem(HomeCategoryModel homeCategoryModel) {
    items.add(homeCategoryModel);
    notifyListeners();
  }

  removeItem(HomeCategoryModel homeCategoryModel) {
    items.remove(homeCategoryModel);
    notifyListeners();
  }
}
