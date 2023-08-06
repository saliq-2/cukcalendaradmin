import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import 'dart:core';
class AddEvent extends StatefulWidget {
  final DateTime firstDate;
  final DateTime lastDate;
  final DateTime? selectedDate;
  const AddEvent(
      {Key? key,
        required this.firstDate,
        required this.lastDate,
        this.selectedDate})
      : super(key: key);

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  late DateTime _selectedDate;
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final dateController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _selectedDate = widget.selectedDate ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Event")),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          TextField(
            controller: dateController,
            readOnly: true,
            decoration: const InputDecoration(labelText:"Enter Event Date"),
            onTap: () async{
              DateTime? newDate = await showDatePicker(
                  context: context,
                  initialDate:
                  _selectedDate ?? DateTime.now(),
                  firstDate: widget.firstDate,
                  lastDate: widget.lastDate);
              if(newDate != null){
                setState(() {
                  _selectedDate = newDate;
                  dateController.text =
                      newDate.toIso8601String().substring(0,10);
                });
              }
            },

          ),

          // InputDatePickerFormField(
          //   firstDate: widget.firstDate,
          //   lastDate: widget.lastDate,
          //   initialDate: _selectedDate,
          //   onDateSubmitted: (date) {
          //     //print(date);
          //     setState(() {
          //       _selectedDate = date;
          //     });
          //   },
          // ),
          TextField(
            controller: _titleController,
            maxLines: 1,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: _descController,
            maxLines: 5,
            decoration: const InputDecoration(labelText: 'Description'),
          ),
          ElevatedButton(
            onPressed: () {
              _addEvent();
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  void _addEvent()  {
    final title = _titleController.text;
    final description = _descController.text;
    if (title.isEmpty) {
      // print('title cannot be empty');
      return;
    }
    FirebaseFirestore.instance.collection('events').add({
      "title": title,
      "description": description,
      "date": Timestamp.fromDate(_selectedDate),
    });
    //if (mounted) {
    Navigator.pop<bool>(context, true);
    // }
  }
}