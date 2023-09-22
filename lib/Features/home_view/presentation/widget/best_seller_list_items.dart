import 'package:bookly/Core/Utils/app_router.dart';
import 'package:bookly/Core/Widgets/custom_error_message.dart';
import 'package:bookly/Core/Widgets/custom_loading_indicator.dart';
import 'package:bookly/Features/home_view/presentation/View%20Model/Newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/Features/home_view/presentation/widget/custom_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../Core/Utils/styles.dart';
import '../../../../../constants.dart';
import '../../Data/Models/Book_Model.dart';
import 'book_rating.dart';

class BestSellerItems extends StatelessWidget {
  const BestSellerItems(
      {super.key, required this.bookModel,
    });

 final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.detailsView,extra: bookModel);
      },
      child: SizedBox(
        height: 130,
        child: Row(
          children: [
            BookImage(imageUrl: bookModel.volumeInfo?.imageLinks?.smallThumbnail??""),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: BlocBuilder<NewestBooksCubit, NewestBooksState>(
                builder: (context, state) {
                  if(state is NewestBooksSuccess){
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .5,
                            child: Text(
                              bookModel.volumeInfo?.title??"",
                              style: Styles.listTitle20
                                  .copyWith(fontFamily: getSectFont),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )),
                        const SizedBox(
                          height: 3,
                        ),
                          Text(
                           bookModel.volumeInfo?.authors![0]??"",
                          style: Styles.text14,
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            Text(
                              "Free",
                              style: Styles.listTitle20
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                             const BookRating()
                          ],
                        )
                      ],
                    );
                  }
                  else if (state is NewestBooksFailure) {
                    return CustomError(errMessage: state.errMessage);
                  }
                  else{
                    return const CustomLoadingIndicator();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
