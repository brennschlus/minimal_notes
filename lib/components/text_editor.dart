import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextEditor extends StatelessWidget {
  final String hintText;
  final double fontSize;
  final TextEditingController textEditingController;
  const TextEditor({
    Key? key,
    required this.fontSize,
    required this.hintText,
    required this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      // maxLines: null is for able to vertical grow
      maxLines: null,
      controller: textEditingController,
      style: GoogleFonts.nunito(
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 35,
        ),
      ),
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.nunito(
            textStyle: TextStyle(
              color: const Color(0xFF9A9A9A),
              fontSize: fontSize,
            ),
          ),
          border: InputBorder.none),
    );
  }
}
