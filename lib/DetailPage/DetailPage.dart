import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class DetailPage extends StatelessWidget {
  final Map<String, dynamic> data;

  const DetailPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data['name'].toString()),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(

          children: [
            CircleAvatar(
              backgroundColor: Colors.purpleAccent,
              radius: 100,
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                tileColor: Colors.grey.shade400,
                leading: Text("Name: ${data['name']}",style: TextStyle(fontSize: 20),),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                tileColor: Colors.grey.shade400,
                leading: Text("Phone no: ${data['phone']}",style: TextStyle(fontSize: 20),),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(onPressed: () async{

                      await FlutterPhoneDirectCaller.callNumber(data['phone']);
                    }, icon: Icon(Icons.phone))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                tileColor: Colors.grey.shade400,
                leading: Text("Department: ${data['department']}",style: TextStyle(fontSize: 20),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                tileColor: Colors.grey.shade400,
                leading: Text("Designation: ${data['designation']}",style: TextStyle(fontSize: 20),),
              ),
            ),





            // Add other fields as needed
          ],
        ),
      ),
    );
  }
}
