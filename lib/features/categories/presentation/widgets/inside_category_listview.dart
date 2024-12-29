import 'package:bookly_application/features/categories/cubits/categorybooks/categorybooks_cubit.dart';
import 'package:bookly_application/features/categories/presentation/widgets/item_inside_category_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class InsideCategoryListview extends StatelessWidget {
  const InsideCategoryListview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategorybooksCubit, CategorybooksState>(
      builder: (context, state) {
        if (state is CategorybooksLoadedState) {
          return ListView.builder(
            itemCount:
                BlocProvider.of<CategorybooksCubit>(context).books.length,
            itemBuilder: (context, index) {
              return ItemInsideCategoryView(
                homeCategoryModel:
                    BlocProvider.of<CategorybooksCubit>(context).books[index],
              );
            },
          );
        } else if (state is CategorybooksFailureState) {
          return Center(
            child: Text(
              'Oops there was an Error',
              style: GoogleFonts.amiri(
                textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
