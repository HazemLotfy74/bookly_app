import 'package:bookly/Core/Utils/service_locater.dart';
import 'package:bookly/Features/home_view/Data/repo/home_repo_imple.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Features/Search_View/Presentation/Views/search_view.dart';
import '../../Features/Search_View/Presentation/view_model/search_books_cubit/search_books_cubit.dart';
import '../../Features/home_view/Data/Models/Book_Model.dart';
import '../../Features/home_view/presentation/View Model/similar_books_cubit/similar_books_cubit.dart';
import '../../Features/home_view/presentation/views/book_details_view.dart';
import '../../Features/home_view/presentation/views/home_view.dart';
import '../../Features/splash_view/Presentation/Views/splash_view.dart';



abstract class AppRouter {
  static const homeView = '/homeview';
  static const detailsView = '/bookdetailview';
  static const searchView = '/searchView';

  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: '/homeview',
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: '/bookdetailview',
      builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
          child:   BookDetails(books:state.extra as BookModel,)),
    ),
    GoRoute(
      path: '/searchView',
      builder: (context, state) => BlocProvider(create: (context) => SearchBooksCubit(getIt.get<HomeRepoImpl>()),
      child: const SearchView()),
    ),
  ]);
}
