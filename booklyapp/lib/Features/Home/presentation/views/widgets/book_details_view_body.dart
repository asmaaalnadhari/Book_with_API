import 'package:booklyapp/Features/Home/data/Model/book_model.dart';
import 'package:flutter/material.dart';
import 'Book_Details_Section.dart';
import 'CustomBookDetailsAppBar.dart';
import 'Similar_Books_Section.dart';
//----------------------------------------------------------------------------------------
class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({Key? key, required this.bookModel}) : super(key: key);

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding:const EdgeInsets.symmetric(
                horizontal: 30.0),
            child: Column(
              children: [
                const  CustomBookDetailsAppBar(),
                BookDetailsSection(bookModel: bookModel,),
                const Expanded(child: SizedBox(height: 50,)),
                const SimilarBooksSection(),

              ],
            ),

          ),
        )
      ],
    );
  }
}
//----------------------------------------------------------------------------------------

