import 'package:booklyapp/Core/Failures/errors.dart';
import 'package:booklyapp/Core/utils/api_service.dart';
import 'package:booklyapp/Features/Home/data/Model/book_model.dart';
import 'package:booklyapp/Features/Home/data/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo{
  final ApiServices apiServices;
  HomeRepoImpl(this.apiServices);

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewsetBooks()async {
   try {
     print('try');
     var data =await
      apiServices.get(endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest &q=computer science');
      List<BookModel>books=[];
      for(var item in data['items'])
        {
            books.add(BookModel.fromJson(item));
        }
      return right(books);
   }   catch (e) {
      //return left(ServerFailure(e.toString()));
     if(e is DioException)
        {
          print(e.toString());
          return left((ServerFailure.fromDioError(e)));
        }
     print('ServerFailure');
     print(e.toString());
     return left(ServerFailure(e.toString()));

   }
  }

  @override
  Future<Either<Failure, List<BookModel>>> FetchFeaturedBooks()async {
    try {
      var data =await
      apiServices.get(endPoint: 'volumes?Filtering=free-ebooks&q=subject:Programming');
      List<BookModel>books=[];
      for(var item in data['items'])
      {
        books.add(BookModel.fromJson(item));

      }
      return right(books);
    } on Exception catch (e) {
      if(e is DioException)
      {

        return left((ServerFailure.fromDioError(e)));
      }
      return left(ServerFailure(e.toString()));
    }  }

  @override
  Future<Either<Failure, List<BookModel>>> FetchSimilarBooks({required String category}) async {
    try {
      var data =await
      apiServices.get(endPoint: 'volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:Programming');
      List<BookModel>books=[];
      for(var item in data['items'])
      {
        books.add(BookModel.fromJson(item));

      }
      return right(books);
    } on Exception catch (e) {
      if(e is DioException)
      {

        return left((ServerFailure.fromDioError(e)));
      }
      return left(ServerFailure(e.toString()));
    }   }

}