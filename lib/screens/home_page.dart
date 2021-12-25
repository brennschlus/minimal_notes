import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minimal_notes/components/info_dialog.dart';
import 'package:minimal_notes/components/rounded_button.dart';
import 'package:minimal_notes/constants.dart';
import 'package:minimal_notes/controllers/note_controller.dart';
import 'package:minimal_notes/screens/editor_page.dart';
import 'package:minimal_notes/screens/note_screen.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final NoteController noteController = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        backgroundColor: backgroundColor,
        onPressed: () {
          Get.to(() => const EditorPage());
        },
        child: Image.asset('assets/images/add.png'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(25, 40, 25, 0),
              child: Row(
                children: [
                  Text(
                    'Notes',
                    style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  RoundedButton(
                      icon: Image.asset('assets/images/info_outline.png'),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => const InfoDialog(),
                        );
                      }),
                ],
              ),
            ),
            if (noteController.notes.isEmpty)
              Column(
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  Image.asset('assets/images/rafiki.png'),
                  Text(
                    'Create your first note !',
                    style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            const SizedBox(
              height: 35,
            ),
            Expanded(
              child: Obx(
                () => ListView.separated(
                    itemBuilder: (context, index) => Dismissible(
                          background: Container(
                            child: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                            padding: const EdgeInsets.fromLTRB(45, 25, 45, 25),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.red,
                            ),
                          ),
                          key: UniqueKey(),
                          onDismissed: (_) {
                            var removed = noteController.notes[index];
                            noteController.notes.removeAt(index);
                            Get.snackbar('Task removed',
                                'The task ${removed.title} — ${removed.text} was successfully removed.',
                                barBlur: 100, colorText: Colors.white);
                          },
                          child: ListTile(
                              title: Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(45, 25, 45, 25),
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      color: Color(
                                          noteController.notes[index].color)),
                                  child: (Text(
                                      noteController.notes[index].title))),
                              onTap: () {
                                Get.to(() => NoteScreen(index: index));
                              }),
                        ),
                    separatorBuilder: (_, __) => const Divider(),
                    itemCount: noteController.notes.length),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
