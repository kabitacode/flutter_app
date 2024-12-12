import 'package:flutter/material.dart';
import 'package:flutter_app/utils/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double fontSize;
  final VoidCallback onPressed;
  final Color textColor;
  final Color buttonColor;

  const CustomButton({super.key,
      required this.text,
      required this.fontSize,
      required this.textColor,
      required this.buttonColor,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25))),
          child: Text(
            text,
            style: GoogleFonts.lato(
                fontSize: fontSize,
                fontWeight: FontWeight.w600,
                color: textColor),
          )),
    );
  }
}
