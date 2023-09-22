
import 'package:dartz/dartz.dart';

import '../../../../Core/Errors/failures.dart';
import '../Models/Book_Model.dart';

abstract class HomeRepo{
  Future<Either<Failure,List<BookModel>>> fetchBestSellerBooks();
  Future<Either<Failure,List<BookModel>>> fetchNewestBooks();
  Future<Either<Failure,List<BookModel>>> fetchSimilarBooks({required String category});
  Future<Either<Failure,List<BookModel>>> fetchSearchedBooks({required String subject});



}