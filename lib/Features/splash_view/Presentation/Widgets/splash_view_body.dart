import 'package:bookly/Core/Utils/app_router.dart';
import 'package:bookly/Core/Utils/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';


class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});
  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {

  @override
  void initState() {
    super.initState();
    getToHome();
  }

  void getToHome() {
    Future.delayed(const Duration(seconds: 5),() {
      GoRouter.of(context).push(AppRouter.homeView);
    },);
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo).animate().fadeIn(duration: const Duration(seconds: 2),delay: const Duration(seconds: 1)),
        const SizedBox(
          height: 5,
        ),
        Animate(
          effects: const [
            FadeEffect(delay: Duration(seconds: 2)),
            SlideEffect(
                duration: Duration(seconds: 1),
                begin: Offset(0, 2),
                end: Offset.zero),
          ],
          child: const Text(
            "Read Free Books",
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

