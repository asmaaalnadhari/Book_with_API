import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../Core/utils/app_router.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextField(
      decoration: InputDecoration(
          enabledBorder:  builtOutlineInputBorder(),
          focusedBorder: builtOutlineInputBorder(),
          hintText: 'Search',
          suffixIcon:  IconButton(
              onPressed: (){
                GoRouter.of(context).push(AppRouter.kSearchView);
              },
              icon: const Opacity(
                opacity: .8,
                child: Icon(FontAwesomeIcons.magnifyingGlass,
                  size: 22,),
              ))
      ),
    );
  }
}
OutlineInputBorder builtOutlineInputBorder()
{
  return OutlineInputBorder(
      borderSide: const BorderSide(
          color: Colors.white
      ),
      borderRadius:BorderRadius.circular(12)
  );
}