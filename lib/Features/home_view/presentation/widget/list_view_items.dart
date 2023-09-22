import 'package:bookly/Core/Utils/app_router.dart';
import 'package:bookly/Core/Widgets/custom_error_message.dart';
import 'package:bookly/Core/Widgets/custom_loading_indicator.dart';
import 'package:bookly/Features/home_view/presentation/View%20Model/Featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'custom_list_item.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height * .25,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: GestureDetector(onTap: () {
                    GoRouter.of(context).push(AppRouter.detailsView,extra: state.books[index]);
                  },
                    child: BookImage(imageUrl: state.books[index].volumeInfo?.imageLinks?.thumbnail??"",),),);
              },
            ),
          );
        }
        else if (state is FeaturedBooksFailure) {
          return CustomError(errMessage: state.errMessage);
        }
        else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}