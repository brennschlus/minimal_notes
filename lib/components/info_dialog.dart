import 'package:flutter/material.dart';
import 'package:minimal_notes/constants.dart';

import 'info_button.dart';

class InfoDialog extends StatelessWidget {
  const InfoDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SimpleDialog(
      contentPadding: EdgeInsets.all(30),
      backgroundColor: backgroundColor,
      children: [
        InfoButton(
          text: 'Design by - Amal',
          url: 'https://dribbble.com/amal',
        ),
        InfoButton(
            text: 'Redisign by - Divya Kelaskar', url: 'https://lu.ma/divya'),
        InfoButton(
            text: 'Illustraions - Storyset', url: 'https://storyset.com/'),
        InfoButton(text: 'Icons - Divya Kelaskar', url: 'https://lu.ma/divya'),
        InfoButton(text: 'Fonts - Google', url: 'https://fonts.google.com'),
        InfoButton(
            text: 'Made by - Pavel Rodionov',
            url: 'https://github.com/brennschlus'),
      ],
    );
  }
}
