import 'package:bookly/Core/Widgets/custom_error_message.dart';
import 'package:bookly/Core/Widgets/custom_loading_indicator.dart';

import 'package:bookly/Features/home_view/presentation/View%20Model/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Data/Models/Book_Model.dart';
import 'custom_list_item.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key, required this.bookModel});

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess){
          return SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height * .16,
            child: ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: BookImage(imageUrl: state.books[index].volumeInfo?.imageLinks?.smallThumbnail??""),
                );
              },
            ),
          );
        }
        else if (state is SimilarBooksFailure) {
             return CustomError(errMessage: state.errMessage);
        }
       else{
         return const CustomLoadingIndicator();
        }
      },
    );
  }
}
