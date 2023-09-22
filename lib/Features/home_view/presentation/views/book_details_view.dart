
import 'package:bookly/Features/home_view/presentation/View%20Model/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Data/Models/Book_Model.dart';
import '../widget/book_details_body.dart';

class BookDetails extends StatefulWidget {
  const BookDetails({super.key, required this.books});

  final BookModel books;

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  void initState() {
    BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(category:widget.books.volumeInfo!.categories![0] );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BookDetailsBody(bookModel: widget.books,),
    );
  }
}
