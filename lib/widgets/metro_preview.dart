import 'package:flutter/material.dart';
import 'package:rihla_4_0/screens/fullMapPage.dart';
import "../widgets/MetroNetworkPainter.dart";


class MetroPreview extends StatefulWidget {

  const MetroPreview({super.key});


  @override
  State<MetroPreview> createState() => _MetroPreviewState();

}



class _MetroPreviewState extends State<MetroPreview> {


  // Stores selected metro line
  // null means nothing selected
  String? selectedLine;



  // Temporary station data
  // Later we connect this with your Station model
  Map<String, List<String>> lineStations = {


    "blue": [

      "Khartoum Central",

      "Bahri Station",

      "North Terminal",

    ],



    "green": [

      "Airport Station",

      "Green Square",

      "University Station",

    ],



    "red": [

      "Airport Station",

      "Market Station",

      "Downtown Station",

    ],


  };



  @override
  Widget build(BuildContext context) {


    return Column(

      mainAxisAlignment: MainAxisAlignment.center,


      children: [


        Container(

          width: 355,

          height: 300,


          decoration: BoxDecoration(

            color: Colors.white,

            borderRadius: BorderRadius.circular(20),


            boxShadow: [

              BoxShadow(

                color: Colors.black12,

                offset: Offset(0,4),

                blurRadius:10,

              )

            ],

          ),




          child: Stack(

            children: [



              // ===============================
              // GRID BACKGROUND
              // ===============================

              CustomPaint(

                size: Size(350,220),

                painter: GridPainter(),

              ),




              // ===============================
              // METRO LINES
              // ===============================

              GestureDetector(


                onTapDown: (details){


                  double x = details.localPosition.dx;

                  double y = details.localPosition.dy;



                  setState(() {


                    // Temporary detection areas
                    // We will improve this later

                    if(x < 150 && y < 120){

                      selectedLine = "red";

                    }


                    else if(x >=120 && x <250){

                      selectedLine = "blue";

                    }


                    else{

                      selectedLine = "green";

                    }


                  });


                },



                child: CustomPaint(

                  size: Size(350,220),

                  painter: MetroNetworkPainter(

                    selectedLine: selectedLine,

                  ),

                ),

              ),




              // ===============================
              // FULL SCREEN BUTTON
              // ===============================

              Positioned(

                right:10,

                top:10,


                child: GestureDetector(


                  onTap:(){

                    Navigator.push(

                      context,

                      MaterialPageRoute(

                        builder:(context)=> FullMapPage(),

                      ),

                    );

                  },



                  child: Container(


                    height:40,

                    width:40,


                    decoration: BoxDecoration(

                      color:Colors.white,

                      borderRadius:BorderRadius.circular(10),


                      boxShadow:[

                        BoxShadow(

                          color:Colors.black12,

                          blurRadius:8,

                        )

                      ],

                    ),



                    child: Icon(

                      Icons.fullscreen_rounded,

                      color:Color(0xFF00515A),

                    ),

                  ),

                ),

              ),





              // ===============================
              // SELECTED LINE INFO BAR
              // ===============================

              if(selectedLine != null)

              Positioned(


                bottom:0,

                left:0,

                right:0,



                child: Container(


                  height:75, 



                  decoration:BoxDecoration(


                    color:Colors.white,


                    borderRadius:BorderRadius.only(

                      bottomLeft:Radius.circular(20),

                      bottomRight:Radius.circular(20),

                    ),



                    boxShadow:[

                      BoxShadow(

                        color:Colors.black12,

                        blurRadius:10,

                      )

                    ],

                  ),




                  child:Padding(


                    padding:EdgeInsets.all(10),



                    child:Column(


                      crossAxisAlignment:CrossAxisAlignment.start,


                      children:[



                        Text(


                          "${selectedLine!.toUpperCase()} LINE",


                          style:TextStyle(

                            fontWeight:FontWeight.bold,

                            color:Color(0xFF00515A),

                          ),

                        ),



                        SizedBox(height:5),



                        Text(


                          lineStations[selectedLine]!.join(" • "),


                          overflow:TextOverflow.ellipsis,


                          style:TextStyle(

                            fontSize:12,

                          ),


                        ),


                      ],


                    ),

                  ),


                ),


              ),


            ],


          ),


        ),


      ],

    );

  }


}






// ==========================================
// SIMPLE GRID PAINTER
// ==========================================

class GridPainter extends CustomPainter {


  @override

  void paint(Canvas canvas, Size size){


    final paint = Paint()

      ..color = Colors.grey.withOpacity(0.12)

      ..strokeWidth = 1;




    // Vertical lines

    for(double x=0; x<=size.width; x+=25){


      canvas.drawLine(

        Offset(x,0),

        Offset(x,size.height),

        paint,

      );


    }





    // Horizontal lines

    for(double y=0; y<=size.height; y+=25){


      canvas.drawLine(

        Offset(0,y),

        Offset(size.width,y),

        paint,

      );


    }


  }





  @override

  bool shouldRepaint(covariant CustomPainter oldDelegate){

    return false;

  }


}