import 'package:booklyapp/Core/widgets/custom_error_widget.dart';
import 'package:booklyapp/Core/widgets/custom_loading_indicator.dart';
import 'package:booklyapp/Features/Home/presentation/view_models/SimilarBooks/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'CustomBookImage.dart';
class SimilarBoxListView extends StatelessWidget {
  const SimilarBoxListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
     builder: (context, state) {
    if(state is SimilarBooksSuccess)
           {
       return SizedBox(
         height: MediaQuery.sizeOf(context).height * .15,
         child: ListView.separated(
           scrollDirection: Axis.horizontal,
           itemBuilder: (context,index){
             return  CustomBookImage(imgUrl: state.books[index].volumeInfo.imageLinks?.thumbnail ??'',);
           }, separatorBuilder: (BuildContext context, int index)
         { return const SizedBox(width: 12,); },
           itemCount: state.books.length,),
       );
     }
   else if(state is SimilarBooksFailure)
   {
     return  CustomErrorWidget(errMessage: state.errMessage);
   } else{
      return const CustomLoadingIndicator();
    }
  },
);

  }

}
