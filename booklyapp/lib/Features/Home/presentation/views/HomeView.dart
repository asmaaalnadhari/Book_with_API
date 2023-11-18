import 'package:booklyapp/Features/Home/presentation/views/widgets/Home-view-body.dart';
import 'package:flutter/material.dart';
//-----------------------------------------
class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeViewBody(),
    );
  }
}
