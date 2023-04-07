import 'package:flutter/cupertino.dart';

Container buildColorContainer({required color}) {
  return Container(
    width: 25,
    height: 25,
    decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(50)),
  );
}
