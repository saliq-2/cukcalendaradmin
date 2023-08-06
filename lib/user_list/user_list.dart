import 'package:carousel_slider/carousel_slider.dart';
import 'package:cuk/dept_model/dept_model.dart';
import 'package:cuk/user_info/user_info.dart';
import 'package:flutter/material.dart';

class user_list extends StatefulWidget
{
  late user_list obj1;
  @override
  State<user_list> createState() => _user_listState();
}

class _user_listState extends State<user_list> {

  List<String> dept_names=[
    "School of Engineering and Technology",
    "School of physical and Chemical Sciences",
    "School of Life Sciences",
    "School of Social Sciences",

  "School of Education",
    "School of languages",
    "School of Media Studies",
    "School of Legal Studies",""
        "School of Business Studies",


  ];


  //Dashboard

  List<String> dashboard=["Departments","Admissions","Results","Courses","Announcements","Locate Us"];
  List<String> dashboard_images=[
    "assets/images/dashboard/department.png",
    "assets/images/dashboard/admiss.png",

    "assets/images/dashboard/results.png",
    "assets/images/dashboard/courses.png",
    "assets/images/dashboard/announcement.png",
    "assets/images/dashboard/locate.png",



  ];
  List <Map<String,dynamic>> faculty=[
    //It
    {
      "name":"Afaq Alam",
        "phone":"9469054115",
      "dept":"it",
    },
    {
      "name":"Amjad Hussain",
      "phone":"23452112",
      "dept":"it",
    },
    {
      "name":"Zahoor Najar",
      "phone":"9419505159",
      "dept":"it",
    },
    {
      "name":"Sheikh Riyaz",
      "phone":"92939102",
      "dept":"it",
    },
    {
      "name":"Yash Paul",
      "phone":"9622603978",
      "dept":"it",
    },
    //Maths
    {
      "name":"Wali Mohammad Shah",
      "phone":"9419501164",
      "dept":"MAths",
    },
    {
      "name":"Dr Aftab Hussain Shah",
      "phone":"7006579471",
      "dept":"MAths",
    },

    {
      "name":"Ghulam Mohammad Sofi",
      "phone":"9906711572",
      "dept":"MAths",
    },

    {
      "name":"Shabbir Ahmad Ahanger",
      "phone":"9906966500",
      "dept":"Maths",
    },

    {
      "name":"Nitin Ambadas Katake",
      "phone":"9469133517",
      "dept":"MAths",
    },




  ];
  List<Map<String,dynamic>> _foundfaculty=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _foundfaculty=[];
  }
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];

    if (enteredKeyword.isEmpty) {

      results = faculty;

    }
    else {
      results = faculty
          .where((user) => user['name'].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState((){
      _foundfaculty=results;
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: Drawer(
        width: MediaQuery.of(context).size.width*0.5,

        child: Column(
          children: [
            DrawerHeader(child: CircleAvatar()),
            ListTile(
              tileColor: Colors.blue,
            )
          ],
        ),
      ),

      appBar: AppBar(

        backgroundColor: Colors.deepPurple.shade400,
        centerTitle: true,
        title: Text("CUK"),
      ),
      body:SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height*1,
            child:Padding(
              padding: const EdgeInsets.only(top: 21),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 50,

                        width: 400,
                        child: TextField(
                          autocorrect: false,
                          onChanged: (value)=>_runFilter(value),
                          decoration: InputDecoration(

                            label: Text("Enter Faculty name"),
                            hintText: "Search For Faculty",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(21),

                            )
                          ),

                        )),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 50,
                    child: _foundfaculty.isNotEmpty
                        ? ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) => Card(
                        elevation: 1,
                        margin: const EdgeInsets.symmetric(vertical: 2),
                        child: InkWell(
                          onTap: ()
                          {

                            Navigator.push(context, MaterialPageRoute(builder: (context)=>user_info(obj: _foundfaculty[index])));
                          },

                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 10.0,
                            ),
                            title: Text(_foundfaculty[index]['name']),
                            // subtitle: Text('${_foundfaculty[index]["phone"]}'),
                          ),
                        ),
                      ),
                    )
                        : const Text(
                      "",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  CarouselSlider(items: [

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(11),
                              child: Image.asset("assets/images/nep.jpeg",fit: BoxFit.fill,))
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 100,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(11),
                              child: Image.asset("assets/images/cuetlogo.jpeg",fit: BoxFit.fill,))
                      ),
                    ),



                  ], options: CarouselOptions(

                    autoPlayInterval: Duration(seconds: 3),
                    aspectRatio: 9/4,
                    autoPlay: true,


                  )),
                  SizedBox(height: 25,),
                  Container(

                    child: Expanded(
                      child: GridView.builder(
                        padding: EdgeInsets.only(left: 10,right: 10),
                           physics: BouncingScrollPhysics(),
                          itemCount: dashboard.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 10,
                        crossAxisCount: 2,
                      ), itemBuilder: (context,index)=>
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: SizedBox(

                              width: 150,
                              height: 280,
                              child: Card(


                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(17),
                                ),
                                shadowColor: Colors.purple.shade500,
                                elevation: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 1,),
                                    CircleAvatar(
                                      radius: 45,
                                      backgroundColor: Colors.transparent,
                                      child: Image.asset(dashboard_images[index]),
                                    ),


                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(child: Text(dashboard[index],style: TextStyle(fontWeight: FontWeight.bold,),)),
                                    ),


                                      InkWell(



                                          onTap: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>dept_model()));
                                          },child: Text("View All",style: TextStyle(color: Colors.purple.shade400),)),



                                  ],







                                )


                              ),
                            ),
                          ),




                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 100)),


                ],
              ),
            ) ,
          ),
        ),
      ) ,
    );
  }
}