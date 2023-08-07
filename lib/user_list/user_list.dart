import 'package:carousel_slider/carousel_slider.dart';
import 'package:cuk/dept_model/dept_model.dart';
import 'package:cuk/user_info/user_info.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class user_list extends StatefulWidget
{
  late user_list obj1;
  @override
  State<user_list> createState() => _user_listState();
}
final Uri _url = Uri.parse('https://flutter.dev');

class _user_listState extends State<user_list> {




  //Dashboard

  List<String> dashboard=["Departments","Admissions","Results","Courses"];
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





  ];


  @override




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(


      appBar: AppBar(

        backgroundColor: Colors.green,
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

                  SizedBox(height: 20,),

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



                                          onTap:(){
                                            // Link(
                                            //     uri: Uri.parse(
                                            //     'https://docs.google.com/forms/d/e/1FAIpQLSd15Ds0dIBeqGPQVxJ09y5rnHn1dlFvAM2dOchSfBWKsoYdVQ/viewform'),
                                            // target: LinkTarget.blank,
                                            // builder: (BuildContext context, FollowLink? openLink){
                                            //
                                            //       return IconButton(onPressed:(){
                                            //         openLink;
                                            //         openLink?.call();
                                            //       }
                                            //
                                            //
                                            //       , icon: Icon(Icons.add));
                                            // });







                                          } ,child: Text("View All",style: TextStyle(color: Colors.purple.shade400),)),



                                  ],







                                )


                              ),
                            ),
                          ),




                      ),
                    ),
                  ),



                ],
              ),
            ) ,
          ),
        ),
      ) ,
    );
  }
}
Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}