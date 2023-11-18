import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/Model/book_model.dart';
import '../../../data/repo/home_repo.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit(this.homeRepo) : super(NewsetBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchNewsetBooks()async{
    print('Before Loading');
    emit(NewsetBooksLoading());
    var result= await homeRepo.fetchNewsetBooks();
    print('After Loading');
    result.fold(
            (failure) =>emit(NewsetBooksFailure(failure.errorMessage)),
            (books) => emit(NewsetBooksSuccess(books)));
  }

}
