import 'package:bookly_application/features/home/cubits/topofweak/topoftheweak_cubit.dart';
import 'package:bookly_application/features/home/presentation/widgets/topofweek_listview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class TopofweakListview extends StatelessWidget {
  const TopofweakListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopoftheweakCubit, TopoftheweakState>(
      builder: (context, state) {
        if (state is TopoftheweakLoadedState) {
          return SizedBox(
            height: 215,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ListView.builder(
                itemCount:
                    BlocProvider.of<TopoftheweakCubit>(context).books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return TopofweekListviewItem(
                    homeCategoryModel:
                        BlocProvider.of<TopoftheweakCubit>(context)
                            .books[index],
                  );
                },
              ),
            ),
          );
        } else if (state is TopoftheweakFailureState) {
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
