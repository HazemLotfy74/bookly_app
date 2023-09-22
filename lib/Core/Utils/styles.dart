import 'package:bookly/constants.dart';
import 'package:flutter/cupertino.dart';

abstract class Styles {
  static const bodyTitle = TextStyle(fontSize: 20, fontWeight: FontWeight.w600,);

  static const listTitle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal
  );

  static const text14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal
  );

  static const text18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500
  );

  static const text16 = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500
  );

  static const text30 = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.normal,
      fontFamily: getSectFont
  );

}
