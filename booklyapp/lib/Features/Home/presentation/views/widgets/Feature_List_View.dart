import 'package:booklyapp/Core/utils/app_router.dart';
import 'package:booklyapp/Core/widgets/custom_error_widget.dart';
import 'package:booklyapp/Features/Home/presentation/view_models/FeaturedBooks/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../Core/widgets/custom_loading_indicator.dart';
import 'CustomBookImage.dart';
import 'package:go_router/go_router.dart';

//=====================================================================================
class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
       builder: (context, state) {
          if(state is FeaturedBooksSuccessful)
            {
              return SizedBox(
                height: MediaQuery.sizeOf(context).height * .3,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context,index){
                    return  InkWell(
                      onTap: (){
                        GoRouter.of(context).push(
                          AppRouter.kBookDetailsView,
                          extra:state.books[index]
                        );
                      },
                        child: CustomBookImage(
                          imgUrl: state.books[index].volumeInfo.imageLinks?.thumbnail??'',
                        ));
                  }, separatorBuilder: (BuildContext context, int index)
                { return const SizedBox(width: 12,); },
                  itemCount: state.books.length,),
              );
            }
          else if(state is FeaturedBooksFailure)
                  {
                  return CustomErrorWidget(errMessage:state.errMessage);
                  }
          else{
           return const CustomLoadingIndicator();
          }
  },
);
  }
}
