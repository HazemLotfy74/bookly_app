import 'package:bookly/Core/Utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key, });


  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(EvaIcons.star,color: Color(0xffFFDD4F) ,),
        const SizedBox(width: 6.3,),
        const Text("0",style: Styles.text16,),
        const SizedBox(width: 3,),
        Text("(0)",style: Styles.text14.copyWith(color: const Color(0xff707070)),)
      ],
    );
  }
}
