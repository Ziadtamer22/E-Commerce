import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

Column buildCategoriesIcons(
    {required String title, required SvgPicture picture, required onTap}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const SizedBox(height: 5),
      InkWell(
        onTap: onTap,
        child: Container(
            alignment: Alignment.center,
            width: 55,
            height: 55,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 249, 249, 249),
                borderRadius: BorderRadius.circular(50),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 225, 225, 225),
                    blurRadius: 10,
                    spreadRadius: 0,
                  )
                ]),
            child: picture),
      ),
      const SizedBox(height: 8),
      Text(
        title,
        style: GoogleFonts.sourceSansPro().copyWith(fontSize: 16),
      ),
    ],
  );
}
