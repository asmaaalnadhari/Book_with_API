import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/Model/book_model.dart';
import '../../../data/repo/home_repo.dart';
part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks({required String category})async{
    emit(SimilarBooksLoading());
    var result= await homeRepo.FetchSimilarBooks(category: category);
    result.fold(
            (failure) =>emit(SimilarBooksFailure(failure.errorMessage)),
            (books) => emit(SimilarBooksSuccess(books)));
  }
}
