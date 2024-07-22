import 'package:flutter/material.dart';
import 'package:my_garden_app/feature/event_journal/domain/entities/event_entity.dart';

class EventListItem extends StatelessWidget {
  const EventListItem({super.key, required this.event});

  final EventEntity event;

  @override
  Widget build(BuildContext context) {
    return Text(event.title!);
  }
}
