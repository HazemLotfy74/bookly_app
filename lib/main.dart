import 'package:bookly/Core/Utils/app_router.dart';
import 'package:bookly/Core/Utils/service_locater.dart';
import 'package:bookly/Features/home_view/Data/repo/home_repo_imple.dart';
import 'package:bookly/Features/home_view/presentation/View%20Model/Featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Features/home_view/presentation/View Model/Newest_books_cubit/newest_books_cubit.dart';

void main() {
  setup();
  runApp(const BookApp());
}

class BookApp extends StatelessWidget {
  const BookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FeaturedBooksCubit(getIt.get<HomeRepoImpl>())..fetchFeaturedBooks(),),
        BlocProvider(create: (context) => NewestBooksCubit(getIt.get<HomeRepoImpl>())..fetchNewBooks(),),

      ],
      child: MaterialApp.router(
        routerConfig:AppRouter.router ,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: primaryColor,
          useMaterial3: true,
          textTheme:GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)
        ),

      ),
    );
  }
}

