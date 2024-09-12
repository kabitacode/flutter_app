import 'package:flutter/material.dart';
import 'package:flutter_app/utils/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtonIcon extends StatelessWidget {
  final Color colorButton;
  final IconData icon;
  final VoidCallback onTap;
  final String label;

  const CustomButtonIcon(
      {Key? key,
      required this.icon,
      required this.colorButton,
      required this.onTap,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        child: Column(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: colorButton, borderRadius: BorderRadius.circular(100)),
              child: Icon(icon),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              label,
              style: GoogleFonts.lato(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: colorTypography),
            )
          ],
        ),
      ),
    );
  }
}
