import 'package:bookly_application/features/home/data/models/home_category_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerListviewItem extends StatelessWidget {
  const BestSellerListviewItem({
    super.key,
    required this.homeCategoryModel,
  });
  final HomeCategoryModel homeCategoryModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: GestureDetector(
        onTap: () => GoRouter.of(context)
            .push('/BookDetailsView', extra: homeCategoryModel),
        child: Container(
          width: 150,
          height: 215,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                image: NetworkImage(homeCategoryModel.image.toString()),
                fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }
}
