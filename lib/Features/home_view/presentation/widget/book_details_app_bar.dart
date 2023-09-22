import 'package:bookly/Core/Utils/app_router.dart';
import 'package:bookly/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';

class DetailsAppBar extends StatelessWidget {
  const DetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: primaryColor,
      leading: IconButton(
        onPressed: () {
          GoRouter.of(context).push(AppRouter.homeView);
        },
        icon: const Icon(EvaIcons.close),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Bootstrap.cart3))
      ],
    );
  }
}
