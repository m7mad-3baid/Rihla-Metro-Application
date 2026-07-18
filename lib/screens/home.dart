import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:rihla_4_0/widgets/SearchBarWidget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                // Header
                child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
              
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 20),
                            child: Container(
                              width: 50,height: 50,
                              decoration: BoxDecoration(color: Color(0xFFE4E1F7) ,borderRadius: BorderRadius.circular(20), border: Border.all(color: Color.fromARGB(255, 157, 142, 255))),
              
                              child: Center(child: Text("HK", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color.fromARGB(255, 74, 46, 255)),)),
                            ),
                          ),
              
              
                          Container(
              
                            margin: const EdgeInsets.only(top: 20, right: 40),
                            child: const Text(
                              "Hababk.. Hussam",
                              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                              
                            ),
                          ),
              
                          Padding(
                            padding: const EdgeInsets.only(right: 10, top: 20),
                            child: Container(
                              child: Icon(CupertinoIcons.bell, color: Color(0xFFBF001C), size: 30,),
                            ),
                          )
                          
                        ],
                      ),
              ),
          
              SizedBox(height: 40,),
          
              Searchbarwidget(),
          
              SizedBox(height: 30,),
          
              Container(
                height: 250, width: 350
                , decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255), borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: Colors.black12,blurRadius: 10,offset:Offset(0, 4) )] ),
          
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
          
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 25),
                            child: Text("NEXT TRAIN", textAlign: TextAlign.left,style: TextStyle(color:  Color(0xFFBF001C), fontWeight: FontWeight.w600,fontSize: 15),),
                          ),
          
          
                          Padding(
                            padding: const EdgeInsets.only(right: 15, top: 15),
                            child: Container(
                              width: 80, height: 30, 
                              decoration: BoxDecoration(color:  Color(0xFFBF001C),borderRadius: BorderRadius.circular(20)),
                              child: Center(child: Text("IN 3 MIN",style: TextStyle(color: const Color.fromARGB(255, 255, 200, 200), fontWeight: FontWeight.bold),)),
                            
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
          
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text("Bahri Central", textAlign: TextAlign.left,style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), ),
                      ),
          
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Icon(Icons.circle, color:  Color(0xFFBF001C),size: 15,),
                            Text("  Current : Bahri Central",style: TextStyle(color: Colors.blueGrey),)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Container(
                          width: 3,height: 20,  
                          decoration: BoxDecoration(color:  Color.fromARGB(255, 112, 112, 112)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Icon(Icons.circle, color:  Color(0xFFBF001C),size: 15,),
                            Text("  TO : Khartoum Central",style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0,),fontSize:20 , fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
          
                      Center(
                        child: Container(
                          
                          width: 250, height: 50,
                          decoration: BoxDecoration(color:  Color(0xFFBF001C), borderRadius: BorderRadius.circular(20)),
                          child: Center(child: Text("View Route",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),)),
                        ),
                      )
                    ],
                  ),
              ),

              SizedBox(height: 20,),

              Container(
                width: 325, height: 100, 
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 241, 195),
                  border: Border.all(color: Color.fromARGB(255, 197, 160, 27)),
                  borderRadius: BorderRadius.circular(20)

                ),

                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Icon(Icons.school_outlined, color: Color(0xFF7C5700), size: 30,),
                        )
                        ,
                       Padding(
                         padding: const EdgeInsets.only(left: 20, top: 15),
                         child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text("Student Discount",style: TextStyle(color: Color(0xFF7C5700), fontWeight: FontWeight.bold, fontSize: 20),),
                             Text("save up to 50% on all rides", style: TextStyle(fontSize: 15),)
                           ],
                         ),

                         
                       ),

                       Padding(
                         padding: const EdgeInsets.only(left: 40,top: 30),
                         child: Icon(Icons.arrow_forward_ios_outlined, color: Color(0xFF7C5700),),
                       )


                    
                      ],

                      
                    ),

                  ],
                ),
              ),

              SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 130, height: 120,
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20),border:Border.all(color: Colors.blueGrey, width: 0.5), boxShadow: [BoxShadow(color: Colors.black12,blurRadius: 10,offset: Offset(0, 4))]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 15),
                          child: Icon(Icons.map_outlined, color: Color(0xFFBF001C),size: 30,),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 15, left: 15 ),
                          child: Text("Routes", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),),
                        )
                      ],
                    ),

                  ),
                  Container(
                    width: 130, height: 120,
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20),border:Border.all(color: Colors.blueGrey, width: 0.5), boxShadow: [BoxShadow(color: Colors.black12,blurRadius: 10,offset: Offset(0, 4))]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 15),
                          child: Icon(Icons.confirmation_num_outlined, color:Color(0xFF284EE2),size: 30,),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 15, left: 15 ),
                          child: Text("Tickets", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),),
                        )
                      ],
                    ),

                  ),
                ],
              )
              ,
              SizedBox(height: 15,),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 130, height: 120,
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20),border:Border.all(color: Colors.blueGrey, width: 0.5), boxShadow: [BoxShadow(color: Colors.black12,blurRadius: 10,offset: Offset(0, 4))]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 15),
                          child: Icon(CupertinoIcons.heart, color: Color.fromARGB(255, 0, 191, 51),size: 30,),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 15, left: 15 ),
                          child: Text("Favorites", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),),
                        )
                      ],
                    ),

                  ),
                  Container(
                    width: 130, height: 120,
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20),border:Border.all(color: Colors.blueGrey, width: 0.5), boxShadow: [BoxShadow(color: Colors.black12,blurRadius: 10,offset: Offset(0, 4))]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 15),
                          child: Icon(Icons.location_pin, color:Color.fromARGB(255, 226, 198, 40),size: 30,),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 15, left: 15 ),
                          child: Text("Nearby", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),),
                        )
                      ],

                    
                    ),

                  ),
                ],
              ),
              SizedBox(height: 20,),

              Align(alignment: Alignment.centerLeft, child:
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text("Saved Stations", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                )
                )


                ,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Row(
                      
                      children: [
                        //pills
                        Padding(
                          padding: const EdgeInsets.only(left: 15, top: 15),
                          child: Container(
                            height: 40, width: 150,
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20),boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 4)),], border: Border.all(width: 0.25,color: const Color.fromARGB(255, 194, 201, 205))),
                    
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.circle,size: 15, color: Colors.blue,),
                                Text("EL MAK NIMIR", style: TextStyle(fontWeight: FontWeight.w500),)
                              ],
                            ),
                          ),
                        ),
                    
                        Padding(
                          padding: const EdgeInsets.only(left: 15, top: 15),
                          child: Container(
                            height: 40, width: 150,
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20),boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 4)),], border: Border.all(width: 0.25,color: const Color.fromARGB(255, 194, 201, 205))),
                    
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.circle,size: 15, color: const Color.fromARGB(255, 243, 33, 33),),
                                Text("KOBER", style: TextStyle(fontWeight: FontWeight.w500),)
                              ],
                            ),
                          ),
                        ),
                    
                        Padding(
                          padding: const EdgeInsets.only(left: 15, top: 15),
                          child: Container(
                            height: 40, width: 150,
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20),boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 4)),], border: Border.all(width: 0.25,color: const Color.fromARGB(255, 194, 201, 205))),
                    
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.circle,size: 15, color: const Color.fromARGB(255, 51, 243, 33),),
                                Text("ARKAWEET", style: TextStyle(fontWeight: FontWeight.w500),)
                              ],
                            ),
                          ),
                        ),
                    
                    
                        Padding(
                          padding: const EdgeInsets.only(left: 15, top: 15),
                          child: Container(
                            height: 40, width: 150,
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20),boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 4)),], border: Border.all(width: 0.25,color: const Color.fromARGB(255, 194, 201, 205))),
                    
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.circle,size: 15, color: const Color.fromARGB(255, 33, 243, 40),),
                                Text("WAD NUBAWI", style: TextStyle(fontWeight: FontWeight.w500),)
                              ],
                            ),
                          ),
                        )
                    
                    
                      ],
                    
                    ),
                  ),
                ),

                Container(
                  height: 300, width: 375,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 4))],
                    border: Border.all(color: Colors.blueGrey, width: 0.25)
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15,top: 15),
                            child: Text("Metro Status", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15, top: 15),
                            child: Text("Live Updates", style: TextStyle(fontWeight: FontWeight.w300),),
                          )
                        ],
                      ),
                      SizedBox(height: 10,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Row(
                              children: [
                                Container(
                                  height: 40, width: 40,
                                  decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(5)),
                                  child: Center(child: Text("BL", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
                                ),

                                 Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text("Blue Line", style: TextStyle(fontSize: 20),),
                          )
                              ],
                            ),

                          ), 

                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.circle, size: 15,color: const Color.fromARGB(255, 9, 144, 14),),
                                Text(" normal")
                              ],
                            ),
                          )


                          
                        ],
                      ), SizedBox(height: 10,)

                      , Divider(indent: 20, endIndent: 20,),

                      SizedBox(height: 10,),

                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Row(
                              children: [
                                Container(
                                  height: 40, width: 40,
                                  decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(5)),
                                  child: Center(child: Text("GR", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
                                ),

                                 Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text("Green Line", style: TextStyle(fontSize: 20),),
                          )
                              ],
                            ),

                          ), 

                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.circle, size: 15,color: const Color.fromARGB(255, 226, 205, 15),),
                                Text(" 5 MIN Delay")
                              ],
                            ),
                          )


                          
                        ],
                      ),

                      SizedBox(height: 10,)

                      , Divider(indent: 20, endIndent: 20,),

                      SizedBox(height: 10,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Row(
                              children: [
                                Container(
                                  height: 40, width: 40,
                                  decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(5)),
                                  child: Center(child: Text("RD", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
                                ),

                                 Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text("Red Line", style: TextStyle(fontSize: 20),),
                          )
                              ],
                            ),

                          ), 

                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.circle, size: 15,color: const Color.fromARGB(255, 144, 9, 18),),
                                Text(" Maintnance ")
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}