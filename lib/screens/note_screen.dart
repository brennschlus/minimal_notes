import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minimal_notes/components/rounded_button.dart';
import 'package:minimal_notes/constants.dart';
import 'package:minimal_notes/controllers/note_controller.dart';
import 'package:minimal_notes/screens/editor_page.dart';

class NoteScreen extends StatelessWidget {
  final NoteController noteController = Get.find();
  final int index;

  NoteScreen({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = '';
    String text = '';
    text = noteController.notes[index].text;
    title = noteController.notes[index].title;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.fromLTRB(25, 40, 25, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    RoundedButton(
                      icon: Image.asset('assets/images/chevron_left.png'),
                      onTap: () {
                        Get.back();
                      },
                    ),
                    const Spacer(),
                    RoundedButton(
                        icon: Image.asset('assets/images/edit.png'),
                        onTap: () {
                          // TODO Implement edit button
                          Get.to(() => EditorPage(index: index));
                        }),
                  ],
                ),
                SingleChildScrollView(
                    child: Column(
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.nunito(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      text,
                      style: GoogleFonts.nunito(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                        ),
                      ),
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
