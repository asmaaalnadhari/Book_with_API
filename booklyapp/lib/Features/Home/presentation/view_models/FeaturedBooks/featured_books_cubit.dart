import 'package:bloc/bloc.dart';
import 'package:booklyapp/Features/Home/data/repo/home_repo.dart';
import 'package:meta/meta.dart';
import '../../../data/Model/book_model.dart';
part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks()async{
    emit(FeaturedBooksLoading());
    var result= await homeRepo.FetchFeaturedBooks();
    result.fold(
            (failure) =>emit(FeaturedBooksFailure(failure.errorMessage)),
            (books) => emit(FeaturedBooksSuccessful(books)));
  }

}
