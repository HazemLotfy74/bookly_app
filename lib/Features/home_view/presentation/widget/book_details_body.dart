import 'package:bookly/Core/Utils/styles.dart';

import 'package:bookly/Features/home_view/presentation/widget/similar_books_listview.dart';
import 'package:flutter/material.dart';
import '../../Data/Models/Book_Model.dart';
import 'book_details_app_bar.dart';
import 'book_details_button.dart';
import 'book_rating.dart';
import 'custom_list_item.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.7),
              child: Column(
                children: [
                  const DetailsAppBar(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * .15),
                    child: AspectRatio(
                      aspectRatio: 2.8 / 3,
                      child: BookImage(
                          imageUrl: bookModel
                                  .volumeInfo?.imageLinks?.smallThumbnail ??
                              ""),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                   Text(
                    bookModel.volumeInfo?.title??"",
                    style: Styles.text30,
                     textAlign: TextAlign.center,
                     maxLines: 2,
                     overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Opacity(
                      opacity: .7,
                      child: Text(bookModel.volumeInfo?.authors?[0]??"",
                          style: Styles.text18.copyWith(
                            fontStyle: FontStyle.italic,
                          ))),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: BookRating(),
                  ),
                   ButtonAction(bookModel: bookModel,),
                  const Expanded(
                      child: SizedBox(
                    height: 30,
                  )),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "You may also like ",
                        style: Styles.text16,
                      )),
                  const SizedBox(
                    height: 35,
                  ),
                   SimilarBooksListView(bookModel: bookModel,)
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
