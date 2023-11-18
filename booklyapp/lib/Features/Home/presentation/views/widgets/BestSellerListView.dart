import 'package:booklyapp/Core/widgets/custom_error_widget.dart';
import 'package:booklyapp/Core/widgets/custom_loading_indicator.dart';
import 'package:booklyapp/Features/Home/presentation/view_models/NewsetBooks/newset_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'BestSellerListViewItem.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetBooksCubit,NewsetBooksState>(
      builder: (BuildContext context, state)
      {
        if(state is NewsetBooksSuccess )
          {
            return ListView.separated
              (
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context,index){
                  return  BookListViewItem(bookModel: state.book[index],);
                },
                separatorBuilder: (context,index){
                  return const SizedBox(height: 20,);
                },
                itemCount: state.book.length
            );
          }
        else if (state is NewsetBooksFailure)
          {
            return CustomErrorWidget(errMessage: state.errMessage);
          }
        else{
          return const CustomLoadingIndicator();
        }
      },);
  }
}
