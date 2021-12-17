import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minimal_notes/components/note.dart';
import 'package:minimal_notes/components/rounded_button.dart';
import 'package:minimal_notes/components/save_dialog.dart';
import 'package:minimal_notes/components/text_editor.dart';
import 'package:minimal_notes/constants.dart';
import 'package:minimal_notes/controllers/note_controller.dart';
import 'package:minimal_notes/screens/home_page.dart';

class EditorPage extends StatefulWidget {
  final int index;

  const EditorPage({this.index = -1});

  @override
  _EditorPageState createState() => _EditorPageState();
}

class _EditorPageState extends State<EditorPage> {
  @override
  Widget build(BuildContext context) {
    final NoteController noteController = Get.put(NoteController());
    int noteColor = Colors.orange.value;
    String text = '';
    String title = '';

    if (widget.index != -1) {
      text = noteController.notes[widget.index].text;
      title = noteController.notes[widget.index].title;
    }
    final TextEditingController titleEditingController =
        TextEditingController(text: title);
    final TextEditingController textEditingController =
        TextEditingController(text: text);
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
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => SaveDialog(
                                saveButton: false,
                                onTapSave: () => Get.back(),
                                onTapDiscard: () =>
                                    Get.offAll(() => HomePage())));
                      },
                    ),
                    const Spacer(),
                    RoundedButton(
                        icon: Image.asset('assets/images/visibility.png'),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                    backgroundColor: backgroundColor,
                                    title: Text(
                                      'Pick a color',
                                      style: GoogleFonts.nunito(
                                          color: Colors.white, fontSize: 32),
                                    ),
                                    content: BlockPicker(
                                      pickerColor: const Color(0xff443a49),
                                      onColorChanged: (color) {
                                        noteColor = color.value;
                                        Get.back(closeOverlays: true);
                                      },
                                    ),
                                  ));
                        }),
                    const SizedBox(
                      width: 20,
                    ),
                    RoundedButton(
                        icon: Image.asset('assets/images/save.png'),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => SaveDialog(
                                    onTapSave: () {
                                      if (widget.index == -1) {
                                        // Add new note
                                        noteController.notes.add(Note(
                                            text: textEditingController.text,
                                            title: titleEditingController.text,
                                            color: noteColor));
                                      } else {
                                        // Editing existing note
                                        var editing =
                                            noteController.notes[widget.index];
                                        editing.text =
                                            textEditingController.text;
                                        editing.title =
                                            titleEditingController.text;
                                        editing.color = noteColor;
                                        noteController.notes[widget.index] =
                                            editing;
                                      }

                                      // Get rid of all stacks and return to HomePage
                                      // this prevents user from returning to the same
                                      // dialog then he hit back button
                                      Get.offAll(() => HomePage());
                                    },
                                    onTapDiscard: () {
                                      Get.back();
                                    },
                                  ));
                        }),
                  ],
                ),
                TextEditor(
                  hintText: "Title",
                  fontSize: 48,
                  textEditingController: titleEditingController,
                ),
                TextEditor(
                  fontSize: 23,
                  hintText: "Type something",
                  textEditingController: textEditingController,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
