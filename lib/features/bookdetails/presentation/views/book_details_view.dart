import 'package:bookly_application/features/bookdetails/presentation/widgets/book_details_view_body.dart';
import 'package:bookly_application/features/home/data/models/home_category_model.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.homeCategoryModel});

  final HomeCategoryModel homeCategoryModel;

  @override
  Widget build(BuildContext context) {
    return BookDetailsViewBody(
      homeCtegoryModel: homeCategoryModel,
    );
  }
}
