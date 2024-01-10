import 'package:flutter/material.dart';
import 'package:flutter_phone_auth/core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
   required this.title,
    this.onPressed,
  }) : super(key: key);
  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),

    )
  ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.disabled)) {
            return Colors.grey; // Disabled color
          }
          return grayScale; // Regular color
        }),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter (
              fontSize: 16.0, fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
    );
  }
}