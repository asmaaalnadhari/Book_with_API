import 'package:booklyapp/Core/utils/functions/launch_url.dart';
import 'package:booklyapp/Features/Home/data/Model/book_model.dart';
import 'package:flutter/material.dart';
import '../../../../../Core/widgets/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';
//====================================================
class BookAction extends StatelessWidget {
  final BookModel bookModel;
  const BookAction({Key? key, required this.bookModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  const EdgeInsets.symmetric(
          horizontal: 8.0),
      child: Row(
        children: [
          const Expanded(child: CustomButton(
            backgroundColor: Colors.white,
            textColor: Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft:  Radius.circular(12)
            ), text:'Free',
          )),
          Expanded(child: CustomButton(
            onPresses: (){
              launcCustomUr(context, bookModel.volumeInfo.previewLink!);
            }
            ,
            backgroundColor: const Color(0xffEF8262),
            textColor: Colors.white,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight:  Radius.circular(12)
            ), text: getText(bookModel),
            fontSize: 16,
          ))

        ],
      ),
    );
  }
}

String getText(BookModel bookModel)
{
  if(bookModel.volumeInfo.previewLink== null)
    {
      return 'Not Available';
    }
  else
    {
      return 'Preview';

    }
}