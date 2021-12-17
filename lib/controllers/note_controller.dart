import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:minimal_notes/components/note.dart';

class NoteController extends GetxController {
  var notes = [].obs;

  @override
  void onInit() {
    List<dynamic>? storedNotes = GetStorage().read<List>('notes');

    if (storedNotes != null) {
      notes = storedNotes.map((e) => Note.fromJson(e)).toList().obs;
    }

    ever(
      notes,
      (callback) => GetStorage().write(
        'notes',
        notes.toList(),
      ),
    );
    super.onInit();
  }
}
