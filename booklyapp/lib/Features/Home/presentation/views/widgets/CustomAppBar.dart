import 'package:booklyapp/Core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../Core/utils/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding:
      const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(AssetsData.logo,height: 20,),
          IconButton(
              onPressed: (){
                GoRouter.of(context).push(AppRouter.kSearchView);
              },
              icon: const
              Icon(FontAwesomeIcons.magnifyingGlass,
                size: 22,))
        ],
      ),
    );
  }
}
