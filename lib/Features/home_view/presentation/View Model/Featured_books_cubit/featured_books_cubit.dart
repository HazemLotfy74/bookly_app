import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home_view/Data/repo/home_repo.dart';
import 'package:equatable/equatable.dart';

import '../../../Data/Models/Book_Model.dart';


part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var result = await homeRepo.fetchBestSellerBooks();
    result.fold(
            (failure) {
                emit(FeaturedBooksFailure(failure.errMessage));
              }, 
            (books) {
                emit(FeaturedBooksSuccess(books));
            });
  }
}
