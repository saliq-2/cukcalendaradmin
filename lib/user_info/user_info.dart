import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class user_info extends StatefulWidget
{
   final Map<String,dynamic> obj ;
  user_info({required this.obj});
  @override
  State<user_info> createState() => _user_infoState();
}

class _user_infoState extends State<user_info> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade400,

      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width*1,
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: CircleAvatar(radius: 80,),
                ),
                SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 320,
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                      tileColor: Colors.grey.shade300,
                      title: Text("Name:"+widget.obj['name']),
                    ),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 320,

                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                      tileColor: Colors.blueAccent.shade100,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Text("Contact: "+widget.obj['phone']),
                          IconButton(onPressed: () async

                          {

                            await FlutterPhoneDirectCaller.callNumber(widget.obj['phone']);

                          }, icon: Icon(Icons.phone))

                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 320,
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                      tileColor: Colors.blueAccent.shade100,
                      title: Text("Department:"+widget.obj['dept']),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 320,
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                      tileColor: Colors.blueAccent.shade100,
                      title: Text("WhatsApp:"+widget.obj['phone']),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
