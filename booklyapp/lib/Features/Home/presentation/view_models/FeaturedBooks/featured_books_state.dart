part of 'featured_books_cubit.dart';

@immutable
abstract class FeaturedBooksState {
  const FeaturedBooksState();
}

class FeaturedBooksInitial extends FeaturedBooksState {}
class FeaturedBooksLoading extends FeaturedBooksState {}
class FeaturedBooksFailure extends FeaturedBooksState {
  final String errMessage;

 const FeaturedBooksFailure(this.errMessage);
}
class FeaturedBooksSuccessful extends FeaturedBooksState {
  final List<BookModel>books;
  const FeaturedBooksSuccessful(this.books);

}
