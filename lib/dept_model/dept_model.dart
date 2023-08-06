import 'package:flutter/material.dart';

class dept_model extends StatefulWidget
{
  @override
  State<dept_model> createState() => _dept_modelState();
}

class _dept_modelState extends State<dept_model> {
  List <Map<String,dynamic>> faculty_info=[
    {

      "name":"Afaq Alam",
      "Designation":"Asst Prof",
      "image":"assets/images/itfaculty/afaq.jpeg",
      "phone":"8940380",

    },
    {
      "name":"Zahoor Najar",
      "Designation":"Asst Prof",
      "image":"assets/images/itfaculty/afaq.jpeg",
      "phone":"0923-2"
    },
    {
      "name":"Amjad Hussain",
      "Designation":"Asst Prof",
      "image":"assets/images/itfaculty/afaq.jpeg",
      "phone":"9023021"
    },


  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

      ),
      body: SafeArea(
        child: GridView.builder(


            itemCount: faculty_info.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              childAspectRatio: 1/1.2,

            ),
            itemBuilder: (context,index)=>



          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                color: Colors.grey.shade200,
              ),


              child: Column(


                children: [
                  SizedBox(
                    height: 20,
                  ),
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blue,
                    backgroundImage: AssetImage(faculty_info[index]['image']),

                  ),
                  SizedBox(height: 10,),
                  Divider(thickness: 2,),
                  SizedBox(height: 10,),
                  Text(faculty_info[index]['name'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  SizedBox(height: 10,),
                  Text(faculty_info[index]['Designation'],style: TextStyle(fontWeight: FontWeight.w700),),
                  Text(faculty_info[index]['phone']),



                ],
              ),
            ),
          )
        ),
      )
    );
  }
}