import 'package:bookly_application/features/home/data/models/home_category_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ItemInsideCategoryView extends StatelessWidget {
  const ItemInsideCategoryView({
    super.key,
    required this.homeCategoryModel,
  });
  final HomeCategoryModel homeCategoryModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: GestureDetector(
        onTap: () => GoRouter.of(context)
            .push('/BookDetailsView', extra: homeCategoryModel),
        child: SizedBox(
          width: double.infinity,
          height: 140,
          child: Row(
            spacing: 10,
            children: [
              Card(
                elevation: 9,
                child: Container(
                  width: 100,
                  height: 135,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(homeCategoryModel.image.toString()),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 10),
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child: Text(
                        homeCategoryModel.title.toString(),
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child: Text(
                        homeCategoryModel.author.toString(),
                        maxLines: 2,
                        style: TextStyle(fontSize: 15, color: Colors.blueGrey),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Free',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        Text(
                          '⭐ 4.8',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
