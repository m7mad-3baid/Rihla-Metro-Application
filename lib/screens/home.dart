import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:rihla_4_0/widgets/SearchBarWidget.dart';
import 'package:rihla_4_0/widgets/BottomBar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor:Color(0xFFFCF9F8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
              
                child:  // Header
                      Row(
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
          
          // the pill
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
                        //ahhhhhh
                        
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
                        //ahhhhhh
                        
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
