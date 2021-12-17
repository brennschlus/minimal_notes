class Note {
  String title;
  String text;
  int color;
  Note({required this.text, required this.title, required this.color});

  factory Note.fromJson(Map<String, dynamic> json) =>
      Note(text: json['text'], title: json['title'], color: json['color']);

  Map<String, dynamic> toJson() =>
      {'text': text, 'title': title, 'color': color};
}
