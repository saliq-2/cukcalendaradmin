import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'event.dart';

class EventItem extends StatelessWidget {
  final Event event;
  final Function()? onTap;

  const EventItem({
    Key? key,
    required this.event,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat.yMMMMd().format(event.date);

    return ListTile(
      title: Text(
        event.title,
      ),
      subtitle: Text(
        formattedDate,
      ),
      onTap: onTap,
    );
  }
}
