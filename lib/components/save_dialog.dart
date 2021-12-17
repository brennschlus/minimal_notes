import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minimal_notes/constants.dart';

class SaveDialog extends StatelessWidget {
  final void Function()? onTapDiscard;
  final void Function()? onTapSave;
  final bool saveButton;

  const SaveDialog(
      {Key? key,
      required this.onTapSave,
      required this.onTapDiscard,
      this.saveButton = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backgroundColor,
      title: Column(
        children: [
          Image.asset('assets/images/info.png'),
          const SizedBox(
            height: 25,
          ),
          Text(
            saveButton
                ? 'Save changes?'
                : 'Are your sure you want discard your changes ?',
            style: GoogleFonts.nunito(color: Colors.white),
          )
        ],
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => Colors.red)),
              onPressed: onTapDiscard,
              child: Text(
                'Discard',
                style: GoogleFonts.nunito(color: Colors.white),
              )),
          TextButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateColor.resolveWith((states) => Colors.green)),
            onPressed: onTapSave,
            child: Text(
              saveButton ? 'Save' : 'Keep',
              style: GoogleFonts.nunito(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
