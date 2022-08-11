import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Text montserrat(String text, {double size = 20, Color color = Colors.black, FontWeight fontWeight = FontWeight.normal}) {
  return Text(
    text,
    style: TextStyle(
      fontFamily: GoogleFonts.montserrat().fontFamily,
      fontSize: size,
      color: color,
      fontWeight: fontWeight,
    ),
  );
}