import 'package:booklyapp/Core/utils/service_locator.dart';
import 'package:booklyapp/Features/Home/data/Model/book_model.dart';
import 'package:booklyapp/Features/Home/data/repo/home_repo_impl.dart';
import 'package:booklyapp/Features/Home/presentation/view_models/SimilarBooks/similar_books_cubit.dart';
import 'package:booklyapp/Features/Home/presentation/views/book_details_view.dart';
import 'package:booklyapp/Features/Search/presentation/view/search_view.dart';
import 'package:go_router/go_router.dart';
import '../../Features/Home/presentation/views/HomeView.dart';
import '../../Features/SplashView/Splash_View.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
abstract class AppRouter{
  static const kHomeView ='/homeView';
  static const kBookDetailsView ='/bookDetails';
  static const kSearchView ='/searchView';

  static  final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const  SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const  HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => 
            BlocProvider(
            create: (BuildContext context)=>SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
            child:
            BookDetailsView(
               bookModel: state.extra  as BookModel,
            )),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const  SearchView(),
      ),

    ]);

}