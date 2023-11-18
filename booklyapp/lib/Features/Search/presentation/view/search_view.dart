import 'package:flutter/material.dart';

import 'Search_View_Body.dart';
class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const SafeArea(
      child:  Scaffold(
        body: SearchViewBody(),
      ),
    );
  }
}
