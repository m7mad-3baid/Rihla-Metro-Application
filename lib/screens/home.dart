import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:rihla_4_0/widgets/SearchBarWidget.dart';
import 'package:rihla_4_0/screens/routes_screen.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../widgets/rihla_map.dart';



List<Map<String, dynamic>> stations = [
  {
    "name": "Khartoum Central",
    "location": LatLng(15.6000, 32.5340),
    "Line": "blue line",
    "nextTrain": "3 min",
  },
  {
    "name": "Bahri Station",
    "location": LatLng(15.6400, 32.5600),
    "Line": "green line",
    "nextTrain": "7 min",
  },
  {
    "name": "AirPort Station",
    "location": LatLng(15.5890, 32.5530),
    "Line": "red line",
    "nextTrain": "9 min",
  },
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 20),
                    child: Container(
                      width: 50,
                      height: 50,

                      decoration: BoxDecoration(
                        color: Color(0xFFE4E1F7),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Color.fromARGB(
                            255,
                            157,
                            142,
                            255,
                          ),
                        ),
                      ),

                      child: Center(
                        child: Text(
                          "HK",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color.fromARGB(
                              255,
                              74,
                              46,
                              255,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),


                  Container(
                    margin: const EdgeInsets.only(
                      top: 20,
                      right: 40,
                    ),

                    child: const Text(
                      
                      "Hababk.. ",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                      top: 20,
                    ),

                    child: Icon(
                      CupertinoIcons.bell,
                      color: Color(0xFFBF001C),
                      size: 30,
                    ),
                  ),
                ],
              ),


              SizedBox(height: 40),


              // Search Bar
              Searchbarwidget(),


              SizedBox(height: 30),


              Align( alignment: Alignment.centerLeft,
               child: Padding(
                 padding: const EdgeInsets.only(left: 20),
                 child: Text("Map", style: TextStyle(fontSize: 25),),
               )
               ),

               SizedBox(height: 15,),



//the map         
                  RihlaMap(),
             

              SizedBox(height: 20,),



              // Next Train Card
              Container(
                height: 300,
                width: 350,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),


                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,

                      children: [

                        Padding(
                          padding:
                              const EdgeInsets.only(
                                left: 10,
                                top: 25,
                              ),

                          child: Text(
                            "NEXT TRAIN",

                            style: TextStyle(
                              color: Color(0xFFBF001C),
                              fontWeight:
                                  FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ),



                        Padding(
                          padding:
                              const EdgeInsets.only(
                                right: 15,
                                top: 15,
                              ),

                          child: Container(
                            width: 80,
                            height: 30,

                            decoration: BoxDecoration(
                              color: Color(0xFFBF001C),
                              borderRadius:
                                  BorderRadius.circular(20),
                            ),


                            child: Center(
                              child: Text(
                                "IN 3 MIN",

                                style: TextStyle(

                                  fontSize: 10,
                                  color: Color.fromARGB(
                                    255,
                                    255,
                                    200,
                                    200,
                                  ),

                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),



                    SizedBox(height: 10),



                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15),

                      child: Text(
                        "Bahri Central",

                        style: TextStyle(
                          fontSize: 25,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ),



                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10),

                      child: Row(
                        children: [

                          Icon(
                            Icons.circle,
                            color: Color(0xFFBF001C),
                            size: 15,
                          ),


                          Text(
                            "  Current : Bahri Central",

                            style: TextStyle(
                              color: Colors.blueGrey,
                            ),
                          ),
                        ],
                      ),
                    ),



                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15),

                      child: Container(
                        width: 3,
                        height: 20,

                        decoration: BoxDecoration(
                          color: Colors.grey,
                        ),
                      ),
                    ),



                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10),

                      child: Row(
                        children: [

                          Icon(
                            Icons.circle,
                            color: Color(0xFFBF001C),
                            size: 15,
                          ),


                          Text(
                            "  TO : Khartoum Central",

                            style: TextStyle(
                              fontSize: 20,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),



                    SizedBox(height: 20),



                    Center(
                      child: GestureDetector(

                        onTap: () {

                          Navigator.pushReplacement(
                            context,

                            MaterialPageRoute(
                              builder: (context) =>
                                  RoutesScreen(),
                            ),
                          );

                        },


                        child: Container(
                          width: 250,
                          height: 50,

                          decoration: BoxDecoration(
                            color: Color(0xFFBF001C),

                            borderRadius:
                                BorderRadius.circular(20),
                          ),


                          child: Center(
                            child: Text(
                              "View Route",

                              style: TextStyle(
                                color: Colors.white,
                                fontWeight:
                                    FontWeight.w700,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),


              SizedBox(height: 20),
                            // Student Discount Card
              Container(
                width: 350,
                height: 100,

                decoration: BoxDecoration(
                  color: Color.fromARGB(
                    255,
                    255,
                    241,
                    195,
                  ),

                  border: Border.all(
                    color: Color.fromARGB(
                      255,
                      197,
                      160,
                      27,
                    ),
                  ),

                  borderRadius:
                      BorderRadius.circular(20),
                ),


                child: Row(
                  children: [

                    Padding(
                      padding:
                          const EdgeInsets.only(
                            left: 10,
                          ),

                      child: Icon(
                        Icons.school_outlined,

                        color: Color(0xFF7C5700),

                        size: 30,
                      ),
                    ),



                    Padding(
                      padding:
                          const EdgeInsets.only(
                            left: 20,
                          ),

                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.center,

                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: [

                          Text(
                            "Student Discount",

                            style: TextStyle(
                              color:
                                  Color(0xFF7C5700),

                              fontWeight:
                                  FontWeight.bold,

                              fontSize: 20,
                            ),
                          ),


                          Text(
                            "save up to 50% on all rides",

                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),



                    Spacer(),



                    Padding(
                      padding:
                          const EdgeInsets.only(
                            right: 15,
                          ),

                      child: Icon(
                        Icons.arrow_forward_ios_outlined,

                        color:
                            Color(0xFF7C5700),
                      ),
                    ),
                  ],
                ),
              ),



              SizedBox(height: 20),



              // Quick Actions
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,

                children: [

                  _buildQuickAction(
                    icon: Icons.map_outlined,
                    title: "Routes",
                    color: Color(0xFFBF001C),
                  ),


                  _buildQuickAction(
                    icon:
                        Icons.confirmation_num_outlined,
                    title: "Tickets",
                    color: Color(0xFF284EE2),
                  ),
                ],
              ),



              SizedBox(height: 15),



              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,

                children: [

                  _buildQuickAction(
                    icon: CupertinoIcons.heart,
                    title: "Favorites",
                    color:
                        Color.fromARGB(
                          255,
                          0,
                          191,
                          51,
                        ),
                  ),


                  _buildQuickAction(
                    icon: Icons.location_pin,
                    title: "Nearby",
                    color:
                        Color.fromARGB(
                          255,
                          226,
                          198,
                          40,
                        ),
                  ),
                ],
              ),



              SizedBox(height: 20),



              Align(
                alignment: Alignment.centerLeft,

                child: Padding(
                  padding:
                      const EdgeInsets.only(
                        left: 15,
                      ),

                  child: Text(
                    "Saved Stations",

                    style: TextStyle(
                      fontSize: 20,
                      fontWeight:
                          FontWeight.w500,
                    ),
                  ),
                ),
              ),



              SizedBox(height: 10),



              // Horizontal station pills
              SingleChildScrollView(
                scrollDirection:
                    Axis.horizontal,

                child: Row(
                  children: [

                    _buildStationPill(
                      "EL MAK NIMIR",
                      Colors.blue,
                    ),

                    _buildStationPill(
                      "KOBER",
                      Colors.red,
                    ),

                    _buildStationPill(
                      "ARKAWEET",
                      Colors.green,
                    ),

                    _buildStationPill(
                      "WAD NUBAWI",
                      Colors.green,
                    ),
                  ],
                ),
              ),



              SizedBox(height: 30),

                            // Metro Status Card
              Container(
                height: 300,
                width: 375,

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius:
                      BorderRadius.circular(20),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],

                  border: Border.all(
                    color: Colors.blueGrey,
                    width: 0.25,
                  ),
                ),


                child: Column(
                  children: [

                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,

                      children: [

                        Padding(
                          padding:
                              const EdgeInsets.only(
                                left: 15,
                                top: 15,
                              ),

                          child: Text(
                            "Metro Status",

                            style: TextStyle(
                              fontWeight:
                                  FontWeight.bold,

                              fontSize: 20,
                            ),
                          ),
                        ),



                        Padding(
                          padding:
                              const EdgeInsets.only(
                                right: 15,
                                top: 15,
                              ),

                          child: Text(
                            "Live Updates",

                            style: TextStyle(
                              fontWeight:
                                  FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    ),



                    SizedBox(height: 15),



                    _buildMetroLine(
                      "BL",
                      "Blue Line",
                      Colors.blue,
                      "normal",
                      Colors.green,
                    ),



                    Divider(
                      indent: 20,
                      endIndent: 20,
                    ),



                    _buildMetroLine(
                      "GR",
                      "Green Line",
                      Colors.green,
                      "5 MIN Delay",
                      Colors.yellow,
                    ),



                    Divider(
                      indent: 20,
                      endIndent: 20,
                    ),



                    _buildMetroLine(
                      "RD",
                      "Red Line",
                      Colors.red,
                      "Maintenance",
                      Color(0xFF900912),
                    ),
                  ],
                ),
              ),


              SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }



  // Quick action card builder
  Widget _buildQuickAction({
    required IconData icon,
    required String title,
    required Color color,
  }) {

    return Container(
      width: 130,
      height: 120,

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius:
            BorderRadius.circular(20),

        border: Border.all(
          color: Colors.blueGrey,
          width: 0.5,
        ),

        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),


      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [

          Padding(
            padding:
                const EdgeInsets.only(
                  left: 10,
                  top: 15,
                ),

            child: Icon(
              icon,

              color: color,

              size: 30,
            ),
          ),



          Padding(
            padding:
                const EdgeInsets.only(
                  left: 15,
                  top: 15,
                ),

            child: Text(
              title,

              style: TextStyle(
                fontWeight:
                    FontWeight.w700,

                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }



  // Saved station pill builder
  Widget _buildStationPill(
    String name,
    Color color,
  ) {

    return Padding(
      padding:
          const EdgeInsets.only(
            left: 15,
            top: 15,
            bottom: 10
          ),

      child: Container(

        height: 40,
        width: 150,

        decoration: BoxDecoration(

          color: Colors.white,

          borderRadius:
              BorderRadius.circular(20),

          boxShadow: [
            BoxShadow(
              color: Colors.black12,

              blurRadius: 10,

              offset: Offset(0, 4),
            ),
          ],

          border: Border.all(
            width: 0.25,

            color: Color.fromARGB(
              255,
              194,
              201,
              205,
            ),
          ),
        ),



        child: Row(

          mainAxisAlignment:
              MainAxisAlignment.spaceEvenly,

          children: [

            Icon(
              Icons.circle,

              size: 15,

              color: color,
            ),



            Text(
              name,

              style: TextStyle(
                fontWeight:
                    FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

    // Metro line builder
  Widget _buildMetroLine(
    String abbreviation,
    String lineName,
    Color lineColor,
    String status,
    Color statusColor,
  ) {

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 5,
      ),

      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween,

        children: [

          Row(
            children: [

              Container(
                height: 40,
                width: 40,

                decoration: BoxDecoration(
                  color: lineColor,
                  borderRadius:
                      BorderRadius.circular(5),
                ),

                child: Center(
                  child: Text(
                    abbreviation,

                    style: TextStyle(
                      color: Colors.white,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                ),
              ),


              SizedBox(width: 10),


              Text(
                lineName,

                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),



          Row(
            children: [

              Icon(
                Icons.circle,

                size: 15,

                color: statusColor,
              ),


              SizedBox(width: 5),


              Text(status),
            ],
          ),
        ],
      ),
    );
  }
}