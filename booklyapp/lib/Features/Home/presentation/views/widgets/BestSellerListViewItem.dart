import 'package:booklyapp/Core/utils/app_router.dart';
import 'package:booklyapp/Features/Home/data/Model/book_model.dart';
import 'package:booklyapp/Features/Home/presentation/views/widgets/CustomBookImage.dart';
import 'package:flutter/material.dart';
import '../../../../../Core/utils/assets.dart';
import '../../../../../Core/utils/styles.dart';
import '../../../../../constant.dart';
import 'Book_Rating.dart';
import 'package:go_router/go_router.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({Key? key, required this.bookModel}) : super(key: key);
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        print('Details');
        GoRouter.of(context).push(AppRouter.kBookDetailsView,extra: bookModel);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
        CustomBookImage(imgUrl: bookModel.volumeInfo.imageLinks?.thumbnail??''),
            const SizedBox(width: 30,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width:MediaQuery.sizeOf(context).height*.3,
                      child:
                      Text(bookModel.volumeInfo.title!,
                        style: Styles.texStyle20.copyWith(
                            fontFamily: kGtSectraFine
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      )),
                  const SizedBox(height: 3,),
                   Text(bookModel.volumeInfo.authors![0],style: Styles.textStyle14,),
                  const SizedBox(height: 3,),
                  Row(
                      children: [
                        Text('free',
                          style: Styles.texStyle20.copyWith(
                              fontWeight: FontWeight.bold
                          ),),
                        const Spacer(),
                         BookRating(
                           count: bookModel.volumeInfo.ratingsCount ??0,
                           rating: bookModel.volumeInfo.ratingsCount ??0,)
                      ],
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
