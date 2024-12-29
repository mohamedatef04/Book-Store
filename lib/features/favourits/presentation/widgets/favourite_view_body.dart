import 'package:bookly_application/core/constants.dart';
import 'package:bookly_application/features/home/data/models/home_category_model.dart';
import 'package:bookly_application/features/providers/favourite_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FavouriteViewBody extends StatelessWidget {
  const FavouriteViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<HomeCategoryModel> items = Provider.of<FavouriteItem>(context).items;
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: mainColor,
          elevation: 0,
          title: Text(
            'Favorites',
            style: GoogleFonts.amiri(
              textStyle: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          centerTitle: true,
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (items.isEmpty) {
              return SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/empty-folder.png',
                      width: 200,
                    ),
                    Text(
                      'No Favourites Items',
                      style: GoogleFonts.amiri(
                        textStyle: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffA19CC5),
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else {
              return ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
                    child: GestureDetector(
                      onTap: () => GoRouter.of(context)
                          .push('/BookDetailsView', extra: items[index]),
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
                                      image: NetworkImage(
                                          items[index].image.toString()),
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
                                    width:
                                        MediaQuery.of(context).size.width * .5,
                                    child: Text(
                                      items[index].title.toString(),
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .5,
                                    child: Text(
                                      items[index].author.toString(),
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.blueGrey),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Free',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 100,
                                      ),
                                      Text(
                                        '⭐ 4.8',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                FavouriteItem favouriteItem =
                                    Provider.of<FavouriteItem>(context,
                                        listen: false);
                                favouriteItem.removeItem(items[index]);
                              },
                              icon: Icon(
                                Icons.delete,
                                size: 30,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ));
  }
}
