import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Data/Models/Book_Model.dart';
import '../../../Data/repo/home_repo.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());


  final HomeRepo homeRepo;
  Future<void> fetchSimilarBooks({required String category })async{
    emit(SimilarBooksLoading());
    var result = await homeRepo.fetchNewestBooks();

    result.fold((failure) {
      emit(SimilarBooksFailure(failure.errMessage));
    },
          (newBooks) {
        emit(SimilarBooksSuccess(newBooks));
      },
    );
  }
}
