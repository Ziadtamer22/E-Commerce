import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildProduct({
  required String imagePath,
  required String productName,
  required String subName,
  required double price,
  required onTap,
}) {
  return SizedBox(
    width: 150,
    height: 220,
    child: InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              color: Colors.white,
              child: Image.network(imagePath),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            productName,
            style: GoogleFonts.sourceSansPro().copyWith(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            subName,
            style: GoogleFonts.sourceSansPro().copyWith(
              fontSize: 12,
              color: const Color(0xff929292),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "EGP $price",
            style: GoogleFonts.sourceSansPro().copyWith(
                fontSize: 16,
                color: const Color(0xff00C569),
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ),
  );
}

Widget textfield({
  required String type,
  required String svgAsset,
  required String hintText,
  bool isVisable = true,
  VoidCallback? onSuffixClicked,
  void Function(String?)? onSaved,
  String? Function(String?)? validator,
}) {
  return TextFormField(
    key: UniqueKey(),
    obscureText: (type == 'password') ? !isVisable : false,
    decoration: InputDecoration(
      border: const OutlineInputBorder(),
      prefixIcon: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SvgPicture.asset(
          svgAsset,
          color: const Color(0xff8F8F8F),
          height: 24,
          width: 24,
          fit: BoxFit.contain,
          matchTextDirection: true,
        ),
      ),
      suffixIcon: (type == 'password')
          ? IconButton(
              icon: const Icon(Icons.remove_red_eye),
              onPressed: onSuffixClicked)
          : null,
      hintText: hintText,
      hintStyle: GoogleFonts.vazirmatn().copyWith(
        fontSize: 14,
        color: const Color(0xffC2C2C2),
      ),
    ),
    validator: validator,
    onSaved: onSaved,
  );
}
