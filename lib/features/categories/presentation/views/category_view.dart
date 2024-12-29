import 'package:bookly_application/features/categories/presentation/widgets/category_view_body.dart';
import 'package:bookly_application/features/home/data/models/category_model.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.categoryModel});
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return CategoryViewBody(
      categoryModel: categoryModel,
    );
  }
}
