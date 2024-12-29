import 'package:bookly_application/core/constants.dart';
import 'package:bookly_application/features/home/cubits/bestseller/bestseller_cubit.dart';
import 'package:bookly_application/features/home/cubits/topofweak/topoftheweak_cubit.dart';
import 'package:bookly_application/features/home/data/models/category_model.dart';
import 'package:bookly_application/features/home/presentation/widgets/bestseller_listview.dart';
import 'package:bookly_application/features/home/presentation/widgets/category_listview.dart';
import 'package:bookly_application/features/home/presentation/widgets/custom_head_text.dart';
import 'package:bookly_application/features/home/presentation/widgets/topofweak_listview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    BlocProvider.of<BestsellerCubit>(context).getBestSellerBooks();
    super.initState();
    BlocProvider.of<TopoftheweakCubit>(context).getTopOfTheWeakBooks();
    super.initState();
  }

  final List<CategoryModel> categories = [
    CategoryModel(image: 'assets/images/general.png', category: 'General'),
    CategoryModel(
        image: 'assets/images/Psychology.png', category: 'Psychology'),
    CategoryModel(image: 'assets/images/Logic.png', category: 'Math'),
    CategoryModel(
        image: 'assets/images/Philosophy.png', category: 'Philosophy'),
    CategoryModel(image: 'assets/images/Space.png', category: 'Space'),
    CategoryModel(image: 'assets/images/law.png', category: 'Law'),
    CategoryModel(image: 'assets/images/Animals.png', category: 'Lions'),
    CategoryModel(
        image: 'assets/images/Science Fiction.png',
        category: 'Science Fiction'),
    CategoryModel(image: 'assets/images/Sports.png', category: 'Sport'),
    CategoryModel(image: 'assets/images/Oceans.png', category: 'Oceans'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: mainColor,
        elevation: 0,
        title: Image.asset(
          'assets/images/Logo.png',
          width: 100,
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () {
              GoRouter.of(context).push('/FavouriteView');
            },
            icon: Icon(
              Icons.bookmark,
              size: 30,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomHeadText(text: 'Categories'),
                CategoryListView(categories: categories),
                CustomHeadText(text: 'Best Seller'),
                BestSellerListview(),
                CustomHeadText(text: 'Top of the Weak'),
                TopofweakListview(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
