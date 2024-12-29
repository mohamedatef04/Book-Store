import 'package:bookly_application/features/home/cubits/bestseller/bestseller_cubit.dart';
import 'package:bookly_application/features/home/presentation/widgets/bestseller_listview_itemm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class BestSellerListview extends StatelessWidget {
  const BestSellerListview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestsellerCubit, BestsellerState>(
      builder: (context, state) {
        if (state is BestsellerLoadedState) {
          return SizedBox(
            height: 215,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ListView.builder(
                itemCount:
                    BlocProvider.of<BestsellerCubit>(context).books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return BestSellerListviewItem(
                    homeCategoryModel:
                        BlocProvider.of<BestsellerCubit>(context).books[index],
                  );
                },
              ),
            ),
          );
        } else if (state is BestsellerFailureState) {
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
