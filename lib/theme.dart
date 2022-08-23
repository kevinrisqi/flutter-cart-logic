// ignore_for_file: prefer_const_constructors

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

Color bgColor1 = Color(0xffE5E5E5);
Color bgColor2 = Color(0xffF6F6F6);
Color bgColor3 = Color(0xffF6F6F6);

Color primaryColor = Color(0xff009AAD);
Color secondaryColor = Color(0xff2E2E2E);
Color alertColor = const Color(0xffED6363);
Color whiteColor = Color(0xffffffff);
Color blueColor = const Color(0xff252836);

TextStyle primaryTextStyle = GoogleFonts.montserrat(color: secondaryColor);
TextStyle secondaryTextStyle = GoogleFonts.montserrat(
  color: secondaryColor.withOpacity(0.75),
);
TextStyle priceTextStyle = GoogleFonts.montserrat(color: primaryColor);
TextStyle actionTextStyle = GoogleFonts.montserrat(color: whiteColor);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
