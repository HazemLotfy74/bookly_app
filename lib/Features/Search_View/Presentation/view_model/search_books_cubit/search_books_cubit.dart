

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home_view/Data/Models/Book_Model.dart';
import '../../../../home_view/Data/repo/home_repo.dart';


part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.homeRepo) : super(SearchBooksInitial());

  final HomeRepo homeRepo;
  Future<void> fetchSearchBooks({required String subject})async{
    emit(SearchBooksLoading());
    var result = await homeRepo.fetchSearchedBooks(subject: subject);

    result.fold((failure) {
      emit(SearchBooksFailure(failure.errMessage));
    },
          (newBooks) {
        emit(SearchBooksSuccess(newBooks));
      },
    );
  }
}
