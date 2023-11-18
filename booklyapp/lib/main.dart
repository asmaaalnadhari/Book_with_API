import 'package:booklyapp/Core/utils/app_router.dart';
import 'package:booklyapp/Core/utils/service_locator.dart';
import 'package:booklyapp/Features/Home/data/repo/home_repo_impl.dart';
import 'package:booklyapp/Features/Home/presentation/view_models/FeaturedBooks/featured_books_cubit.dart';
import 'package:booklyapp/Features/Home/presentation/view_models/NewsetBooks/newset_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setup();
  runApp(BooklyApp());
}
class BooklyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context)=>FeaturedBooksCubit(
              getIt.get<HomeRepoImpl>()
    )..fetchFeaturedBooks(),

    ),
        BlocProvider(
          create: (context)=>NewsetBooksCubit(
              getIt.get<HomeRepoImpl>()
          )..fetchNewsetBooks(),

        ),
      ],
      child:MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kPrimaryColor,
            textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)
        ),
      ),
    );
  }
}

