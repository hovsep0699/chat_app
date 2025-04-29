import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

TextStyle get header1 => GoogleFonts.inter(
  fontSize: 24,
  fontWeight: FontWeight.w600,
  color: const Color.fromRGBO(0, 0, 0, 1),
);
TextStyle get header3 => GoogleFonts.inter(
  fontSize: 26,
  fontWeight: FontWeight.w300,
  height: 1.352,
  letterSpacing: -2,
  color: white,
);
TextStyle get header2 => GoogleFonts.inter(
  fontSize: 20,
  fontWeight: FontWeight.w600,
  color: const Color.fromRGBO(0, 0, 0, 1),
);
TextStyle get body1 => GoogleFonts.inter(
  color: const Color.fromRGBO(0, 0, 0, 1),
  fontSize: 14,
  height: 1.5,
  fontWeight: FontWeight.w400,
);
TextStyle get body2 => GoogleFonts.inter(
  color: const Color.fromRGBO(0, 0, 0, 1),
  fontSize: 16,
  fontWeight: FontWeight.w400,
);

TextStyle get body3 => GoogleFonts.inter(
  fontWeight: FontWeight.w400,
  fontSize: 12,
  color: const Color.fromRGBO(130, 130, 130, 1),
);

TextStyle get body4 => GoogleFonts.roboto(
  fontWeight: FontWeight.w400,
  fontSize: 16,
  height: 0.875,
  letterSpacing: 0.5,
  color: defaultTextColor,
);

TextStyle get body5 => GoogleFonts.inter(
  fontWeight: FontWeight.w500,
  fontSize: 20,
  color: const Color(0xff3CED78),
);
