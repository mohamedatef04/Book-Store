import 'package:bookly_application/core/constants.dart';
import 'package:bookly_application/features/categories/cubits/categorybooks/categorybooks_cubit.dart';
import 'package:bookly_application/features/categories/presentation/widgets/inside_category_listview.dart';
import 'package:bookly_application/features/home/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryViewBody extends StatefulWidget {
  const CategoryViewBody({super.key, required this.categoryModel});
  final CategoryModel categoryModel;

  @override
  State<CategoryViewBody> createState() => _CategoryViewBodyState();
}

class _CategoryViewBodyState extends State<CategoryViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CategorybooksCubit>(context)
        .getCategoryBooks(category: widget.categoryModel.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: mainColor,
        elevation: 0,
        title: Text(
          widget.categoryModel.category,
          style: GoogleFonts.amiri(
            textStyle: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search_rounded),
            color: Colors.black,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              onChanged: (value) {
                searchBook(value);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          Expanded(child: InsideCategoryListview()),
        ],
      ),
    );
  }

  void searchBook(String query) {
    var suggestions = BlocProvider.of<CategorybooksCubit>(context).books.where(
      (element) {
        final bookName = element.title!.toLowerCase().toString();
        final input = query.toLowerCase();
        return bookName.contains(input);
      },
    ).toList();
    setState(() {
      BlocProvider.of<CategorybooksCubit>(context).books = suggestions;
    });
  }
}
