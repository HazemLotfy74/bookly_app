import 'package:bookly/Core/Errors/failures.dart';
import 'package:bookly/Core/Utils/api_service.dart';
import 'package:bookly/Features/home_view/Data/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../Models/Book_Model.dart';



class HomeRepoImpl extends HomeRepo{
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchBestSellerBooks() async{
    try{
      var data = await apiService.get(endPoints: 'volumes?Filtering=free-ebooks&q=computer science');

      List<BookModel> books = [];
      for(var item in data['items']){
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    }

    catch(e)
      {
        if(e is DioException){
          return Left(ServerFailure.fromDioException(e));
        }
          return Left(ServerFailure(e.toString()));
      }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async{
    try{
      var data = await apiService.get(endPoints: 'volumes?Filtering=free-ebooks&q=math&Sorting=newest');

      List<BookModel> books = [];
      for(var item in data['items']){
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    }

    catch(e)
    {
      if(e is DioException){
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({required String category}) async{
    try{
      var data = await apiService.get(endPoints: 'volumes?Filtering=free-ebooks&q=math&Sorting=relevance');

      List<BookModel> books = [];
      for(var item in data['items']){
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    }

    catch(e)
    {
      if(e is DioException){
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchedBooks({required String subject}) async{
    try{
      var data = await apiService.get(endPoints: 'volumes?Filtering=free-ebooks&q=$subject&Sorting=relevance');

      List<BookModel> books = [];
      for(var item in data['items']){
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    }

    catch(e)
    {
      if(e is DioException){
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

}