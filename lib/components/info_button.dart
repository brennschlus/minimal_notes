import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoButton extends StatelessWidget {
  final String text;
  final String url;

  const InfoButton({
    Key? key,
    required this.text,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        text,
        style: GoogleFonts.nunito(fontSize: 15, color: Colors.white),
      ),
      onPressed: () async {
        if (await canLaunch(url)) {
          await launch(
            url,
          );
        }
      },
    );
  }
}
