import 'package:flutter/material.dart';
import 'BestSellerListView.dart';
import 'CustomAppBar.dart';
import 'Feature_List_View.dart';
import '../../../../../Core/utils/styles.dart';
//-------------------------------------------------
class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics:  BouncingScrollPhysics(),
        slivers: [
         SliverToBoxAdapter(
           child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                 Padding(
                   padding: EdgeInsets.symmetric(
                       horizontal: 30.0),
                   child: CustomAppBar(),
                 ),
                 FeaturedBooksListView(),
                 SizedBox(height: 50,),
                 Padding(
                   padding: EdgeInsets.symmetric(
                       horizontal: 30.0),
                   child: Text('Newset Books',style: Styles.texStyle18,),
                 ),
                SizedBox(height: 20,),
                   ],
                ),
              ),
         SliverFillRemaining(
             child: Padding(
               padding: EdgeInsets.symmetric(
                   horizontal: 30.0),
               child: BestSellerListView(),
             )),
      ]
    );
  }
}


