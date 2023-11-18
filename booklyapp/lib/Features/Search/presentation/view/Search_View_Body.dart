import 'package:booklyapp/Features/Search/presentation/view/widgets/Custome-Search-Text-Field.dart';
import 'package:flutter/material.dart';
import '../../../../Core/utils/styles.dart';
import '../../../Home/presentation/views/widgets/BestSellerListViewItem.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const  Padding(
      padding:   EdgeInsets.symmetric(
          horizontal:30.0),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           CustomSearchTextField(),
            SizedBox(height: 16,),
         Text('Search Result',style: Styles.texStyle18,),
          SizedBox(height: 16,),
          Expanded(child: SearchResultListView())

        ],
      ),
    );
  }
}

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated
      (
        padding: EdgeInsets.zero,
        itemBuilder: (context,index){
          return const Center();//const BookListViewItem();
        },
        separatorBuilder: (context,index){
          return const SizedBox(height: 20,);
        },
        itemCount: 10
    );
  }
}
