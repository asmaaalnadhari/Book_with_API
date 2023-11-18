import 'package:booklyapp/Features/Home/data/Model/book_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../Core/Failures/errors.dart';

abstract class HomeRepo{
Future<Either<Failure,List<BookModel>>>fetchNewsetBooks();
Future<Either<Failure,List<BookModel>>> FetchFeaturedBooks();
Future<Either<Failure,List<BookModel>>> FetchSimilarBooks({required String category});

}