import 'package:booklyapp/Features/Home/data/Model/book_model.dart';
import 'package:flutter/material.dart';
import '../../../../../Core/utils/styles.dart';
import 'Book_Rating.dart';
import 'BooksAction.dart';
import 'CustomBookImage.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({Key? key, required this.bookModel}) : super(key: key);
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal:MediaQuery.sizeOf(context).width* .2),
          child:  CustomBookImage(imgUrl: bookModel.volumeInfo.imageLinks?.thumbnail ??'' ,),
        ),
        const SizedBox(height: 43,),
         Text(bookModel.volumeInfo.title!,style: Styles.texStyle30,textAlign: TextAlign.center,),
        const SizedBox(height: 6,),
        Opacity(
          opacity: .7,
          child: Text(bookModel.volumeInfo.authors?[0] ??'',
            style: Styles.texStyle18.copyWith(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w500,
          ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 18,),
         BookRating(
           mainAxisAlignment: MainAxisAlignment.center,
           count: bookModel.volumeInfo.ratingsCount ??0,
           rating: bookModel.volumeInfo.averageRating ??0,),
        const SizedBox(height: 37,),
         BookAction(bookModel: bookModel,),
      ],
    );
  }
}
