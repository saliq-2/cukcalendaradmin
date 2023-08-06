import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'event.dart';
import 'add_event.dart';
import 'edit_events.dart';
import 'event_item.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late DateTime _focusedDay;
  late DateTime _firstDay;
  late DateTime _lastDay;
  late DateTime _selectedDay;
  late CalendarFormat _calendarFormat;
  late Map<DateTime, List<Event>> _events;

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  @override
  void initState() {
    super.initState();
    _events = LinkedHashMap(
      equals: isSameDay,
      hashCode: getHashCode,
    );
    _focusedDay = DateTime.now();
    _firstDay = DateTime.utc(2020, 1, 1);
    _lastDay = DateTime.utc(2030, 12, 31);
    _selectedDay = DateTime.now();
    _calendarFormat = CalendarFormat.month;
    _loadFirestoreEvents();
  }

  _loadFirestoreEvents() async {
    final firstDay = DateTime(_focusedDay.year, _focusedDay.month, 1);
    final lastDay = DateTime(_focusedDay.year, _focusedDay.month + 1, 0);
    _events = {};

    final snap = await FirebaseFirestore.instance
        .collection('events')
        .where('date', isGreaterThanOrEqualTo: firstDay)
        .where('date', isLessThanOrEqualTo: lastDay)
        .get();
    for (var doc in snap.docs) {
      final event = Event.fromFirestore(doc);
      final day = DateTime.utc(event.date.year, event.date.month, event.date.day);
      if (_events[day] == null) {
        _events[day] = [];
      }
      _events[day]!.add(event);
    }
    setState(() {});
  }

  List<Event> _getEventsForTheDay(DateTime day) {
    return _events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calendar')),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(8),
            clipBehavior: Clip.antiAlias,
            child: TableCalendar(
              formatAnimationCurve: Curves.easeIn,

              headerStyle: const HeaderStyle(formatButtonVisible: false, titleCentered: true,
              decoration: BoxDecoration(
                color: Colors.green
              )

              ),
              eventLoader: _getEventsForTheDay,
              calendarFormat: _calendarFormat,
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              focusedDay: _focusedDay,
              firstDay: _firstDay,
              lastDay: _lastDay,
              onPageChanged: (focusedDay) {
                setState(() {
                  _focusedDay = focusedDay;
                });
                _loadFirestoreEvents();
              },
              selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              calendarStyle: const CalendarStyle(
                rowDecoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1,color: Colors.green)
                  )
                ),

                weekendTextStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                selectedDecoration: BoxDecoration(shape: BoxShape.circle, color: Colors.green),
              ),
            ),
          ),
          Text("*Mulsim Holidays are subject to the appearance of moon"),
          ..._getEventsForTheDay(_selectedDay).map(
                (event) => EventItem(
                event: event,
                onTap: () async {
                  final res = await Navigator.push<bool>(
                    context,
                    MaterialPageRoute(
                      builder: (_) => EditEvent(
                          firstDate: _firstDay,
                          lastDate: _lastDay,
                          event: event),
                    ),
                  );
                  if (res ?? false) {
                    _loadFirestoreEvents();
                  }
                },
                onDelete: () async {
                  final delete = await showDialog<bool>(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text("Delete Event?"),
                      content: const Text("Are you sure you want to delete?"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.black,
                          ),
                          child: const Text("No"),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: const Text("Yes"),
                        ),
                      ],
                    ),
                  );
                  if (delete ?? false) {
                    await FirebaseFirestore.instance
                        .collection('events')
                        .doc(event.id)
                        .delete();
                    _loadFirestoreEvents();
                  }
                }
            ),
          ),


          Expanded(
            child: ListView.builder(
              itemCount: _events.length,
              itemBuilder: (context, index) {
                DateTime day = _events.keys.elementAt(index);
                List<Event> eventsForTheDay = _events[day] ?? [];
                return ExpansionTile(
                  title: Text(
                    "${day.day}/${day.month}/${day.year}",
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),
                  ),
                  children: eventsForTheDay.map((event) {
                    return EventItem(
                      event: event,
                      onTap: () async {
                        final res = await Navigator.push<bool>(
                          context,
                          MaterialPageRoute(
                            builder: (_) => EditEvent(
                              firstDate: _firstDay,
                              lastDate: _lastDay,
                              event: event,
                            ),
                          ),
                        );
                        if (res ?? false) {
                          _loadFirestoreEvents();
                        }
                      },
                      onDelete: () async {
                        final delete = await showDialog<bool>(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: const Text("Delete Event?"),
                            content: const Text("Are you sure you want to delete?"),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, false),
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.black,
                                ),
                                child: const Text("No"),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, true),
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.red,
                                ),
                                child: const Text("Yes"),
                              ),
                            ],
                          ),
                        );
                        if (delete ?? false) {
                          await FirebaseFirestore.instance.collection('events').doc(event.id).delete();
                          _loadFirestoreEvents();
                        }
                      },
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 100),
        child: FloatingActionButton(
          onPressed: () async {
            final result = await Navigator.push<bool>(
              context,
              MaterialPageRoute(
                builder: (_) => AddEvent(
                  firstDate: _firstDay,
                  lastDate: _lastDay,
                  selectedDate: _selectedDay,
                ),
              ),
            );
            if (result ?? false) {
              _loadFirestoreEvents();
            }
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
