import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../DetailPage/DetailPage.dart';

class FirebaseSearchScreen extends StatefulWidget {
  const FirebaseSearchScreen({Key? key}) : super(key: key);

  @override
  State<FirebaseSearchScreen> createState() => _FirebaseSearchScreenState();
}

class _FirebaseSearchScreenState extends State<FirebaseSearchScreen> {
  List searchResult = [];

  void searchFromFirebase(String query) async {
    final result = await FirebaseFirestore.instance
        .collection('items')
        .where('name', isGreaterThanOrEqualTo: query)
        .where('name', isLessThanOrEqualTo: query + '\uf8ff')
        .get();

    setState(() {
      searchResult = result.docs.map((e) => e.data()).toList();
    });
  }

  void clearSearch() {
    setState(() {
      searchResult = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Faculty name"),
      ),
      body: Column(

        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
                hintText: "Search Here",
              ),
              onChanged: (query) {
                if (query.isEmpty) {
                  clearSearch(); // Clear the list when the search query is empty
                } else {
                  query=query.toString();
                  query=query.toLowerCase();
                  searchFromFirebase(query);
                }
              },
            ),
          ),
          if (searchResult.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: searchResult.length,
                itemBuilder: (context, index) {
                  final itemData = searchResult[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(data: itemData),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(itemData['name'].toString()),
                      subtitle: Text(itemData['sn'].toString()),
                    ),
                  );
                },
              )

            ),
          if (searchResult.isEmpty)
            Center(
              child: Text("No results found."),
            ),
        ],
      ),
    );
  }
}
