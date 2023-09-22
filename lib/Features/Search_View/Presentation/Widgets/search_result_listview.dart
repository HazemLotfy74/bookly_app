import 'package:bookly/Core/Utils/styles.dart';
import 'package:bookly/Core/Widgets/custom_error_message.dart';
import 'package:bookly/Core/Widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home_view/presentation/widget/best_seller_list_items.dart';
import '../view_model/search_books_cubit/search_books_cubit.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        if (state is SearchBooksInitial) {
          return const Center(child: Text("No books searched yet",style: Styles.text30,textAlign: TextAlign.center,));
        }
        else if (state is SearchBooksSuccess) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return  Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: BestSellerItems(bookModel: state.books[index]),);
            },
          );
        }
        else if (state is SearchBooksFailure) {
          return CustomError(errMessage: state.errMessage);
        }
        else{
          return const  CustomLoadingIndicator() ;
        }
      },
    );
  }
}
