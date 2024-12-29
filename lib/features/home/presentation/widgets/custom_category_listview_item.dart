import 'package:bookly_application/features/home/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCategoryListviewItem extends StatelessWidget {
  const CustomCategoryListviewItem({
    super.key,
    required this.categoryMModel,
  });

  final CategoryModel categoryMModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => GoRouter.of(context)
                .push('/CategoryView', extra: categoryMModel),
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color.fromARGB(255, 107, 133, 140)),
              child: Center(
                child: Image(
                  image: AssetImage(categoryMModel.image),
                  width: 60,
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              categoryMModel.category,
              style: GoogleFonts.amiri(
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
