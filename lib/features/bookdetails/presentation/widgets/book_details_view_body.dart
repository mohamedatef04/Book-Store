import 'package:bookly_application/core/constants.dart';
import 'package:bookly_application/features/home/data/models/home_category_model.dart';
import 'package:bookly_application/features/providers/favourite_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.homeCtegoryModel});

  final HomeCategoryModel homeCtegoryModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: mainColor,
        elevation: 0,
        title: Text(
          'Book Details',
          style: GoogleFonts.amiri(
            textStyle: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              spacing: 5,
              children: [
                Container(
                  width: 180,
                  height: 243,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(homeCtegoryModel.image.toString()),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    homeCtegoryModel.title.toString(),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: GoogleFonts.amiri(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30)),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    homeCtegoryModel.author.toString(),
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style:
                        GoogleFonts.amiri(textStyle: TextStyle(fontSize: 20)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        FavouriteItem favouriteItem =
                            Provider.of<FavouriteItem>(context, listen: false);

                        bool exist = false;

                        var itemInSaved = favouriteItem.items;
                        for (var item in itemInSaved) {
                          if (item.title == homeCtegoryModel.title) {
                            exist = true;
                          }
                        }

                        if (exist) {
                          QuickAlert.show(
                              context: context,
                              type: QuickAlertType.error,
                              text: 'Already in your Saved');
                        } else {
                          favouriteItem.addItem(homeCtegoryModel);

                          QuickAlert.show(
                              context: context,
                              type: QuickAlertType.success,
                              text: 'Item added');
                        }
                      },
                      child: Container(
                        width: 150,
                        height: 55,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            ),
                            color: const Color.fromARGB(255, 5, 20, 46)),
                        child: Center(
                          child: Text(
                            'Save Item',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _launchUrl();
                      },
                      child: Container(
                        width: 150,
                        height: 55,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            color: const Color.fromARGB(255, 2, 57, 68)),
                        child: Center(
                          child: Text(
                            'Preview',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Description : ',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.amiri(
                          textStyle: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      homeCtegoryModel.description.toString(),
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    final Uri url = Uri.parse(homeCtegoryModel.previewLink.toString());
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
