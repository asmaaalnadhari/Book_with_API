import 'package:flutter/material.dart';

import '../../../../../Core/utils/styles.dart';
import 'SimilarBoxListView.dart';
class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('You can also like',style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.w600
        ),),
        const SizedBox(height: 16,),
        const SimilarBoxListView(),
        const SizedBox(height: 40,),
      ],
    );
  }
}
