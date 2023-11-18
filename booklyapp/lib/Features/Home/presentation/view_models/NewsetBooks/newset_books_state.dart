part of 'newset_books_cubit.dart';

@immutable
abstract class NewsetBooksState {
  const NewsetBooksState();
}

class NewsetBooksInitial extends NewsetBooksState {}
class NewsetBooksLoading extends NewsetBooksState {}
class NewsetBooksFailure extends NewsetBooksState {
  final String errMessage;

  const NewsetBooksFailure(this.errMessage);

}
class NewsetBooksSuccess extends NewsetBooksState {
  final List<BookModel> book;

  const NewsetBooksSuccess(this.book);
}
