import 'package:bookly_application/features/home/data/models/category_model.dart';
import 'package:bookly_application/features/home/presentation/widgets/custom_category_listview_item.dart';
import 'package:flutter/material.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    super.key,
    required this.categories,
  });

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CustomCategoryListviewItem(
              categoryMModel: categories[index],
            );
          },
        ),
      ),
    );
  }
}
