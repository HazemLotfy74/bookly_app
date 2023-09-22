import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';

import '../view_model/search_books_cubit/search_books_cubit.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration:  InputDecoration(
        suffixIcon: const Icon(Bootstrap.search,color: Colors.grey,),
        hintText: 'Subject',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.white
          ),
        ),
      ),
      onFieldSubmitted: (subject) {
        BlocProvider.of<SearchBooksCubit>(context).fetchSearchBooks(subject: subject);
      },
    );
  }
}
