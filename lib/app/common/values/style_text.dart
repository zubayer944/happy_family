import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyleText {
  static TextStyle get nunitoSans_900_20 => _baseNunitoSans(FontWeight.w900, 20);

  static TextStyle get nunitoSans_700_22 => _baseNunitoSans(FontWeight.w700, 22);
  static TextStyle get nunitoSans_700_16 => _baseNunitoSans(FontWeight.w700, 16);
  static TextStyle get nunitoSans_700_18 => _baseNunitoSans(FontWeight.w700, 18);
  static TextStyle get nunitoSans_700_15 => _baseNunitoSans(FontWeight.w700, 15);
  static TextStyle get nunitoSans_700_14 => _baseNunitoSans(FontWeight.w700, 14);
  static TextStyle get nunitoSans_700_12 => _baseNunitoSans(FontWeight.w700, 12);

  static TextStyle get nunitoSans_400_16 => _baseNunitoSans(FontWeight.w400, 16);
  static TextStyle get nunitoSans_400_15 => _baseNunitoSans(FontWeight.w400, 15);

  static TextStyle get nunitoSans_400_14 => _baseNunitoSans(FontWeight.w400, 14);
  static TextStyle get nunitoSans_400_12 => _baseNunitoSans(FontWeight.w400, 12);
  static TextStyle get nunitoSans_400_13 => _baseNunitoSans(FontWeight.w400, 13);


  static TextStyle get nunitoSans_300_16 => _baseNunitoSans(FontWeight.w300, 16);
  static TextStyle get nunitoSans_300_14 => _baseNunitoSans(FontWeight.w300, 14);

  static TextStyle get nunitoSans_600_14 => _baseNunitoSans(FontWeight.w600, 14);
  static TextStyle get nunitoSans_600_16 => _baseNunitoSans(FontWeight.w600, 16);
  static TextStyle get nunitoSans_600_18 => _baseNunitoSans(FontWeight.w600, 18);

  // custom
  static TextStyle get nunitoSans_500_14 => _baseNunitoSans(FontWeight.w500, 14);
  static TextStyle get nunitoSans_500_16 => _baseNunitoSans(FontWeight.w500, 16);
  static TextStyle get nunitoSans_500_12 => _baseNunitoSans(FontWeight.w500, 12);

  static TextStyle get nunitoSans_600_14_underLine => _baseNunitoSans(FontWeight.w600, 14);

  static TextStyle _baseNunitoSans(
      FontWeight weight,
      double size,

      ) =>
      GoogleFonts.nunitoSans(
        fontSize: size,
        fontWeight: weight,
      );
}