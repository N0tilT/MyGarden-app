import 'package:flutter/material.dart';
class GardenVisualPage extends StatefulWidget {
  @override
  _GardenVisualPageState createState() => _GardenVisualPageState();
}

class _GardenVisualPageState extends State<GardenVisualPage> {
  List<NoteData> notes = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Введите текст заметки"),
              content: TextField(
                onSubmitted: (text) {
                  setState(() {
                    notes.add(NoteData(position: const Offset(50, 50), text: text));
                  });
                  Navigator.of(context).pop();
                },
              ),
            );
          },
        );
      },
      child: ColoredBox(
        color: Colors.white,
        child: Stack(
          children: List.generate(notes.length, (index) {
            return DraggableNote(
              noteData: notes[index],
              onDelete: () {
                setState(() {
                  notes.removeAt(index);
                });
              },
              onEdit: (newText) {
                setState(() {
                  notes[index].text = newText;
                });
              },
            );
          }),),
        ),
      
    );
  }
}

class NoteData {
  Offset position;
  String text;
  double width;
  double height;

  NoteData({
    required this.position,
    required this.text,
    this.width = 100,
    this.height = 50,
  });
}

class DraggableNote extends StatefulWidget {
  final NoteData noteData;
  final ValueChanged<String> onEdit;
  final VoidCallback onDelete;

  const DraggableNote({
    super.key,
    required this.noteData,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  _DraggableNoteState createState() => _DraggableNoteState();
}

class _DraggableNoteState extends State<DraggableNote> {
  bool isMoving = false;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.noteData.position.dx,
      top: widget.noteData.position.dy,
      child: GestureDetector(
        onLongPress: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Редактируйте заметку"),
                content: TextField(
                  controller: TextEditingController(text: widget.noteData.text),
                  onSubmitted: (newText) {
                    widget.onEdit(newText);
                    Navigator.of(context).pop();
                  },
                ),
              );
            },
          );
        },
        onTap: () {
          setState(() {
            isMoving = !isMoving;
          });
        },
        onPanUpdate: isMoving
            ? (details) {
                setState(() {
                  widget.noteData.position += details.delta;
                });
              }
            : null,
        child: Stack(
          children: [
            Container(
              width: widget.noteData.width,
              height: widget.noteData.height,
              decoration: BoxDecoration(
                color: Colors.yellow,
                border: Border.all(
                  color: isMoving ? Colors.blue : Colors.transparent,
                  width: 2,
                ),
              ),
              child: Center(
                child: Text(
                  widget.noteData.text,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
            if (isMoving) _buildResizeHandle(1, 1),
          ],
        ),
      ),
    );
  }

  Widget _buildResizeHandle(int x, int y) {
    return Positioned(
      left: x == 0 ? -40 : widget.noteData.width -40,
      top: y == 0 ? -40 : widget.noteData.height -40,
      child: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            if (x == 0) {
              widget.noteData.width -= details.delta.dx;
            } else {
              widget.noteData.width += details.delta.dx;
            }
            if (y == 0) {
              widget.noteData.height -= details.delta.dy;
            } else {
              widget.noteData.height += details.delta.dy;
            }

            // Ограничение минимального размера
            widget.noteData.width = widget.noteData.width.clamp(100.0, double.infinity);
            widget.noteData.height = widget.noteData.height.clamp(100.0, double.infinity);
          });
        },
        child: const CircleAvatar(
          radius: 40,
          backgroundColor: Colors.blue,
        ),
      ),
    );
  }
}