import 'package:flutter/material.dart';

class CustomColors {
  static const Color primaryColor = Color(0xFF000122);
  static final MaterialStateProperty<Color> primaryColorM =
      MaterialStateProperty.all<Color>(primaryColor);

  static const Color secondaryColor = Color(0xFF000AFF);
  static final MaterialStateProperty<Color> secondaryColorM =
      MaterialStateProperty.all<Color>(secondaryColor);

  static const Color cardColorTypeOne = Color(0xFFC7BB54);
  static final MaterialStateProperty<Color> cardColorTypeOneM =
      MaterialStateProperty.all<Color>(cardColorTypeOne);

  static const Color cardColorTypeTwo = Color(0xff8C90F5);
  static final MaterialStateProperty<Color> cardColorTypeTwoM =
  MaterialStateProperty.all<Color>(cardColorTypeTwo);

  static const Color cardColorTypeThree = Color(0xff90E4A2);
  static final MaterialStateProperty<Color> cardColorTypeThreeM =
  MaterialStateProperty.all<Color>(cardColorTypeThree);

  static const Color customGreyColor = Color(0xFFd1d1d1);
  static final MaterialStateProperty<Color> customGreyColorM =
      MaterialStateProperty.all<Color>(customGreyColor);

  static const Color backgroundColor = Color(0xFFF1F2FA);
  static final MaterialStateProperty<Color> backgroundColorM =
      MaterialStateProperty.all<Color>(backgroundColor);

  static const Color errorColor = Color(0xFFA50203);
  static final MaterialStateProperty<Color> errorColorM =
      MaterialStateProperty.all<Color>(errorColor);
}
