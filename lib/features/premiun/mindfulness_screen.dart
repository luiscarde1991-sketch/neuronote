class MindfulnessScreen extends StatelessWidget {
  final List<Map<String, String>> exercises = [
    {"title": "Respiración 4-7-8", "desc": "Inhala 4s, retiene 7s, exhala 8s"},
    {"title": "Escaneo Corporal", "desc": "Siente cada parte de tu cuerpo"},
    {"title": "Gratitud", "desc": "Escribe 3 cosas por las que estás agradecido"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bienestar")),
      body: ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (ctx, i) {
          final ex = exercises[i];
          return Card(
            child: ListTile(
              title: Text(ex["title"]!),
              subtitle: Text(ex["desc"]!),
              trailing: Icon(Icons.play_arrow),
              onTap: () => _startExercise(context, ex),
            ),
          );
        },
      ),
    );
  }

  void _startExercise(BuildContext context, Map<String, String> ex) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(ex["title"]!),
        content: Text(ex["desc"]! + "\n\n¡Comienza ahora!"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Listo"),
          ),
        ],
      ),
    );
  }
}